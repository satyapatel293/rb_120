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

class Player
  attr_accessor :move, :name, :score

  def initialize
    @score = 0
    set_name
  end

  def winner?
    score >= 3
  end

  def reset_score
    @score = 0 
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
  attr_accessor :human, :computer

  def initialize
    system('clear')
    @human = Human.new
    @computer = Computer.new
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
    puts "#{human.name}: #{human.score} || #{computer.name}: #{computer.score}"
    puts "#{human.name} chose #{human.move} || #{computer.name} chose #{computer.move}."
    display_round
  end

  def update_score
    if human.move > computer.move
      human.score += 1
    elsif human.move < computer.move
      computer.score += 1
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

  def end_game
    if (human.winner? || computer.winner?)
      display_winner
      [human, computer].each { |player| player.reset_score }
    end
  end

  def display_winner
    system('clear')
    puts "#{human.name}: #{human.score} || #{computer.name}: #{computer.score}"
    if human.winner?
      puts "#{human.name.upcase} WON THE GAME!!"
    elsif computer.winner?
      puts "#{computer.name.upcase} WON THE GAME!!"
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

  def round 
    human.choose
    computer.choose
    update_score
    display_screen
  end

  def play
    display_welcome_message

    loop do # game loop
      loop do # round loop
        round
        break if end_game
      end
      break unless play_again?
    end 
    display_goodbye_message
  end
end

RPSGame.new.play
