class Tile
  attr_accessor :value

  def initialize(value = 0, given = false)
    @given = given
    @value = value
  end

end
