require_relative 'tic_tac_toe'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    pos_moves = []
    board.each do |row|
      row.each do |idx|
        pos_moves << TicTacToeNode(board, , self) if idx.empty?
      end
    end
    pos_moves
  end

end

class Array
  def deep_dup
    self.map do |el|
      if el.is_a?(Array)
        el.deep_dup
      else
        el
      end
    end
  end
end
