# Create a 2-Player math game where players take turns to answer simple math addition problems. A new math question is generated for each turn by picking two numbers between 1 and 20. The player whose turn it is is prompted the question and must answer correctly or lose a life.
require './player'

class Game_On
  attr_accessor :current_player

  def initialize
    puts "GAME STARTING"
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1
    puts "-------------"
    puts "Current player is #{@current_player.name}"
    puts "-------------"
    play()
  end

  def play
    loop do
      ask_question
      break if check_game_over
      switch_players
      puts "----- NEW TURN -----"
    end
  end

  def ask_question
    num1 = rand(1..20)
    num2 = rand(1..20)
    operator = [:+, :-, :*].sample
    answer = num1.send(operator, num2)
    print "#{current_player.name}, what is #{num1} #{operator} #{num2} = "
    player_response = gets.chomp.to_i
    check_answer(answer, player_response)
  end

  def check_answer(answer, player_response)
    if answer == player_response
      puts "#{player_response}? YES! You are correct." 
    else
      puts "#{player_response}? NO! That is incorrect."
      @current_player.lose_life
      puts "#{@current_player.name} now has #{@current_player.current_life} life"
    end
    puts "#{@player1.name}: #{@player1.current_life} life vs #{@player2.name}: #{@player2.current_life} life"
    puts
  end

  def switch_players
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def check_game_over
    if @player1.current_life == 0 
      puts "GAME OVER! #{@player1.name} has lost. #{@player2.name} wins with #{@player2.current_life} life"
      return true
    elsif @player2.current_life == 0
      puts "GAME OVER! #{@player2.name} has lost. #{@player1.name} wins with #{@player1.current_life} life"
      return true
    end
    return false
  end
end


game = Game_On.new