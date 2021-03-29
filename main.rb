# Create a 2-Player math game where players take turns to answer simple math addition problems. A new math question is generated for each turn by picking two numbers between 1 and 20. The player whose turn it is is prompted the question and must answer correctly or lose a life.
require './player'

class Game_On

  def ask_question
    num1 = rand(1..20)
    num2 = rand(1..20)
    operator = [:+, :-, :*, :/].sample
    answer = num1.send(operator, num2)
    puts "What is #{num1} #{operator} #{num2} = #{answer}"
  end

end



# Player1 = Player.new
# Player2 = Player.new

# puts "Player 1 has #{Player1.current_life} lives"
# puts "Player 2 has #{Player2.current_life} lives"

# Question1 = Question.new
# puts Question1.num1
# puts Question1.num2
# puts Question1.ask

game = Game_On.new
game.ask_question