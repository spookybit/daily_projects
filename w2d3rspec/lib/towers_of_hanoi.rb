class HanoiGame
  attr_reader :board

  def initialize
    @board = [[3, 2, 1], [], []]
  end

  def move(pole_from, pole_to)
    raise "Pole not in bounds" if !pole_from.between?(0, 2) || !pole_to.between?(0, 2)
    num = @board[pole_from].pop
    @board[pole_to] << num
  end

  def won?
    num = @board.index { |x| x.length == 3 }
    num != 0 && !num.nil?
  end
end
