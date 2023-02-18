=begin


Evens and odds is a two player game in which each player is either even or odd. Each round the players throw a hand of either 1 or 2 fingers and if the sum of the round is even the even player wins else if the sum of the round is odd the odd player wins. The first player to win 3 rounds wins the game. 
------------------------
Nouns: player, finger, round 
Verbs: assign, throw, sum
------------------------
=end 

require 'pry'
class Player
  attr_accessor :even_or_odd, :current_hand, :score

  def initialize(assigment)
    @even_or_odd = assigment
    @score = 0 
  end 

  def sum(other)
    current_hand + other.current_hand
  end 

  def beat?(other)
    total = sum(other)

    case @even_or_odd
    when :odd 
      total.odd?
    when :even        
      total.even?
    end 
  end 

  def update_score
    @score += 1 
  end 
end 


class Human < Player  
  def throw 
    answer = nil 
    loop do 
      puts 'Please throw (1) finger or (2) fingers!'
      answer = gets.chomp.to_i
      break if [1,2].include?(answer) 
      puts 'Please only choose 1 or 2 fingers...'
    end 

    self.current_hand = answer 
  end 

  def to_s
    'Human'
  end 
end 

class Computer < Player 
  def throw 
    self.current_hand = [1,2].sample 
  end 

  def to_s
    'Computer'
  end 
end 

class EOOGame  
  attr_accessor :human, :computer

  def initialize 
    new_game
  end 

  def new_game
    assigment_1, assigment_2 = random_start
    @human = Human.new(assigment_1)
    @computer = Computer.new(assigment_2)
    @round = 0 
  end 

  def random_start
    [:odd, :even].shuffle 
  end 

  def display_welcome_message
    puts 'Welcome to Evens or Odds!'
    puts '    Each round you can throw 1 or 2 fingers. 
    If the sum of the fingers is your starting postion(even or odd) 
    you win that round. The first player to win 3 rounds wins the game.'
    puts ''
    puts "You are #{human.even_or_odd.to_s}!"
    puts "Computer is #{computer.even_or_odd.to_s}!"
    puts 'press any key to continue'
    gets
  end 

  def display_goodbye_message
    puts "Thanks for playing EVENS AND ODDS!"
  end 

  def display_board
    system 'clear'
    puts "Score"
    puts "-----"
    puts "Human(#{human.even_or_odd.to_s}): #{human.score}"
    puts "Computer(#{computer.even_or_odd.to_s}) : #{computer.score}"
    puts ''
    puts "Round: #{@round}"
    puts "Human chose #{human.current_hand} || Computer chose #{computer.current_hand}"
   end 

  def round 
    human.throw
    computer.throw 
    round_winner.update_score
    @round += 1 
    display_board
    display_round_winner
  end

  def round_winner 
    return human if human.beat?(computer)
    return computer if computer.beat?(human)
  end 

  def display_round_winner
   puts "#{round_winner} won the round!"
   puts 'press any key'
   gets.chomp 
  end 

  def game_over 
    human.score == 3 || computer.score == 3
  end 

  def display_result
    if human.score == 3 
      puts 'YOU WON THE GAME!!!'
    elsif computer.score == 3 
      puts 'COMPUTER WON THE GAME!!'
    end 
  end 
  
  def play_again?
    answer = nil 
    loop do 
      puts 'Want to play again? (y/n)'
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts 'Sorry please enter y or n'
    end 

    answer == 'y'
  end

  def play 
    system 'clear'
    display_welcome_message
    loop do  
      loop do
        round 
        break if game_over
      end 
      display_result
      break unless play_again?
      new_game
    end 
    display_goodbye_message
  end 
      
end

EOOGame.new.play