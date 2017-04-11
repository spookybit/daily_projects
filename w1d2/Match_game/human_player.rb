
class Player

  def initialize(name)
    @player1 = name
  end

  def take_guess1
    gets.chomp.split(",").map { |num| num.to_i }
  end

  def take_guess2
    gets.chomp.split(",").map { |num| num.to_i }
  end

  def delete_matches(pos1, pos2)
    puts "Match found"
  end
end
