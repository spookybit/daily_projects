class Card
  attr_accessor :face_up
  attr_reader :num
  def initialize(num)
    @num = num
    @face_up = false
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end
end
