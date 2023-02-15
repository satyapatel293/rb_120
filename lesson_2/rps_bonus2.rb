class Move
  VALUES = ['rock', 'paper', 'scissors']
  include Comparable

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end

  def to_s
    @value
  end
end

class Score
  attr_accessor :player, :computer

  def initialize
    @player = 0
    @computer = 0
  end 

  def increment_player
    self.player += 1 
  end 

  def increment_computer 
    self.computer += 1 
  end 

  def reset
    self.player = 0
    self.computer = 0
  end 

  def winner? 
    if computer == 3 
      return :computer
    elsif player == 3
      return :player
    end 
  end 
end 


class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    puts "Please chosose rock, paper, or scissors:"
    choice = nil
    loop do
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invlaid choice"
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ["R2D2", "Hal", "Chappie", "Sonny", "Number 5"].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer, :score

  def initialize
    @human = Human.new
    @computer = Computer.new
    @score = Score.new
  end

  def display_welcome_message
    system('clear')
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Good bye!"
  end

  def display_screen
    system('clear')
    puts "#{human.name} chose #{human.move} || #{computer.name} chose #{computer.move}."
    puts "#{human.name}: #{score.player} || #{computer.name}: #{score.computer}."
    display_round
  end

  def update_score
    if human.move > computer.move
      score.increment_player
    elsif human.move < computer.move
      score.increment_computer
    end
  end

  def display_round
    if human.move > computer.move
      puts "#{human.name} won round!"
    elsif human.move < computer.move
      puts "#{computer.name} won round!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end

    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end

  def play
    display_welcome_message

    loop do 
      loop do
        human.choose
        computer.choose
        update_score
        display_screen
        break if score.winner?
      end
      break unless play_again?
    end 

    display_goodbye_message
  end
end

RPSGame.new.play
