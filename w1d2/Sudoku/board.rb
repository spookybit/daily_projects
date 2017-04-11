require_relative "tile"
require 'byebug'

class Board
  attr_accessor :grid

  def self.open_file(file)
    grid = []
    File.open(file).each do |line|
      array = []
      line.chars.each do |char|
        if char == "0"
          array << Tile.new
        else
          array << Tile.new(char.to_i, true) unless char == "\n"
        end
      end
      grid << array
    end
    grid
  end

  def initialize(file, grid = Board.open_file(file))
    @grid = grid
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []= (pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  def render
    empty_arr = []
    grid.each do |row|
      line = []
      row.each do |tile|
        line << tile.value
      end
      empty_arr << line
    end
    p empty_arr
  end

  def rows_solved?
    grid.all? do |row|
      line = []
      row.each { |ch| line << ch.value }
      line.sort == (1..9).to_a
    end
  end

  def columns_solved?
    zipped_grid = grid.transpose
    zipped_grid.all? do |row|
      line = []
      row.each { |ch| line << ch.value }
      line.sort == (1..9).to_a
    end
  end

  def get_square
    #first_three_rows =
    #[1,2,3,4,5,6,7,8,9]
    #[1,2,3,4,5,6,7,8,9]
    #[1,2,3,4,5,6,7,8,9]

    #...rows.map! |row| row = [1,2,3,4,5,6,7,8,9]
    #row[0..2] == [1,2,3]
    # So when you map it, you're changing "each" row[1..9] into row[0..2]
    first_three_rows = grid[0..2]
    first_three_rows.map! { |row| row[0..2] }
    flattened = first_three_rows.flatten
    flattened.map {|tile| tile.value}.sort
  end

  def squares_solved?
    debugger
    9.times do
      square = get_square
      return false unless square == (1..9).to_a
      grid.rotate(3)
    end
    true
  end

  def solved?
    (rows_solved? && columns_solved?) && squares_solved?
  end

end
