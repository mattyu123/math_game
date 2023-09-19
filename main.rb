# Module that allows a match question to be asked
module Question
  def ask_question
    @num1 = rand(20)
    @num2 = rand(20)
  
    actual_answer = @num1 + @num2
    puts "What does #{@num1} + #{@num2} equal?"
    return actual_answer
  end
end

# Class that 
class Game
  attr_accessor :player1, :player2
  include Question

  def initialize
    @player1 = Player.new
    @player2 = Player.new
  end

  def play_the_game
    player1_lives = @player1.number_of_lives
    player2_lives = @player2.number_of_lives

    while player1_lives > 0 && player2_lives > 0 do
      puts "---Player1's Turn---"
      player1_answer = ask_question
      player1_input = player1.get_user_input

      if player1_input.to_i == player1_answer.to_i
        puts "That is the correct answer!"
        puts 
      
      else 
        puts "This is not right"
        puts 
        reduce_life = player1.reduce_lives
        player1_lives -= 1
      end

      puts "---Player2's Turn---"
      player2_answer = ask_question
      player2_input = player2.get_user_input

      if player2_input.to_i == player2_answer.to_i
        puts "That is the correct answer!"
        puts 
      
      else 
        puts "This is not right"
        puts 
        reduce_life = player2.reduce_lives
        player2_lives -= 1
      end

      if player1_lives == 0
        puts "Player 2 is the winner with a score of #{player2_lives}"
        puts "--- GAME OVER ---"
        break
      
      elsif player2_lives == 0
        puts "Player 1 is the winner with a score of #{player1_lives}/3"
        puts "--- GAME OVER ---"
        break
      end
      puts
      puts
      puts "----- NEW TURN ------"
      puts "Player1: #{player1_lives} lives remaining vs Player2: #{player2_lives} lives remaining"
      puts
    end
  end
end

class Player < Game
  include Question

  attr_accessor :number_of_lives

  def initialize
    @number_of_lives = 3
  end

  def get_user_input
    gets.chomp
  end

  def reduce_lives
    @number_of_lives -= 1
    return @number_of_lives
  end
end

new_game = Game.new

new_game.play_the_game
