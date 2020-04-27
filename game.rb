require "./player"

class Game

  attr_accessor :current_player, :player_1, :player_2

  def initialize
    self.player_1 = Player.new("1")
    self.player_2 = Player.new("2")
    self.current_player = self.player_1
    self.generate_problem
  end

  def generate_problem

      x = rand(21)
      y = rand(21)
      puts "Player #{self.current_player.number}: What does #{x} plus #{y} equal?"
      answer = gets.chomp.to_i

      if (answer == x + y)
        puts "Player #{self.current_player.number}: YES! You are correct!"
      else 
        puts "Player #{self.current_player.number}: Seriously? No!"
        self.subtract_lives(self.current_player)
      end

      self.current_player = self.current_player.number == "1" ? self.player_2 : self.player_1

      if self.player_1.lives == 0 || self.player_2.lives == 0
        puts "Player #{self.current_player.number} wins with a score of #{self.current_player.lives}/3"
        puts "----- GAME OVER -----"
        puts "Goodbye!"
      else 
        puts "P1: #{self.player_1.lives}/3 vs P2: #{self.player_2.lives}/3"
        puts "----- NEW TURN -----"
        self.generate_problem
      end

  end

  def subtract_lives(player)
      lives = player.lives
      lives = lives - 1
      player.lives = lives
  end

end