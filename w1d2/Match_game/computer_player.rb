require "byebug"

require_relative "board"
require_relative "game"

class Computer
  attr_accessor :matched, :board

  def initialize
    @matched = {}
  end

  def get_board(board)
    @board = board
  end

  def take_guess1
    if @matched.empty? || find_hash_match == false
      guess = random_guess
      @matched[guess] = @board[guess].num
      guess
    else
      answers = find_hash_match
      answers[0]
    end
  end

  def take_guess2
    if find_hash_match == false
      @board.reveal(random_guess)
      @matched[random_guess] = @board[random_guess].num
    else
      answers = find_hash_match
      answers[1]
    end
  end

  def delete_matches(pos1, pos2)
    @matched.delete(pos1)
    @matched.delete(pos2)
  end

  def find_hash_match
    @matched.each do |k,v|
      @matched.each do |k2, v2|
        if v == v2
          return [k, k2]
        end
      end
    end
    false
  end

  def random_guess
    random = [[0,1,2,3].sample , [0,1,2,3].sample]
    until @board[random].face_up == false
      random = [[0,1,2,3].sample , [0,1,2,3].sample]
    end
    random
  end
end
