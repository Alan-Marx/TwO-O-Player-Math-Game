class Player
  attr_accessor :lives
  attr_reader :number

  def initialize(number)
    @number = number
    @lives = 3
  end
end