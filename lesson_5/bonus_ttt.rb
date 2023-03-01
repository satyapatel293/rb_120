module Banners
  BANNER = <<~BNR
  ████████╗██╗ ██████╗████████╗ █████╗  ██████╗████████╗ ██████╗ ███████╗
  ╚══██╔══╝██║██╔════╝╚══██╔══╝██╔══██╗██╔════╝╚══██╔══╝██╔═══██╗██╔════╝
    ██║   ██║██║        ██║   ███████║██║        ██║   ██║   ██║█████╗  
    ██║   ██║██║        ██║   ██╔══██║██║        ██║   ██║   ██║██╔══╝  
    ██║   ██║╚██████╗   ██║   ██║  ██║╚██████╗   ██║   ╚██████╔╝███████╗
    ╚═╝   ╚═╝ ╚═════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝   ╚═╝    ╚═════╝ ╚══════╝ 
  BNR

  WIN_COMPUTER = <<~COM
  ██████╗ ██████╗ ███╗   ███╗██████╗ ██╗   ██╗████████╗███████╗██████╗     
  ██╔════╝██╔═══██╗████╗ ████║██╔══██╗██║   ██║╚══██╔══╝██╔════╝██╔══██╗    
  ██║     ██║   ██║██╔████╔██║██████╔╝██║   ██║   ██║   █████╗  ██████╔╝    
  ██║     ██║   ██║██║╚██╔╝██║██╔═══╝ ██║   ██║   ██║   ██╔══╝  ██╔══██╗    
  ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║     ╚██████╔╝   ██║   ███████╗██║  ██║    
  ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝      ╚═════╝    ╚═╝   ╚══════╝╚═╝  ╚═╝    
                                                                            
              ██╗    ██╗██╗███╗   ██╗███████╗██╗██╗██╗██╗██╗                
              ██║    ██║██║████╗  ██║██╔════╝██║██║██║██║██║                
              ██║ █╗ ██║██║██╔██╗ ██║███████╗██║██║██║██║██║                
              ██║███╗██║██║██║╚██╗██║╚════██║╚═╝╚═╝╚═╝╚═╝╚═╝                
              ╚███╔███╔╝██║██║ ╚████║███████║██╗██╗██╗██╗██╗                
              ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚══════╝╚═╝╚═╝╚═╝╚═╝╚═╝                

  COM

  WIN_PLAYER = <<~PLR
    ██████╗ ██╗      █████╗ ██╗   ██╗███████╗██████╗     
    ██╔══██╗██║     ██╔══██╗╚██╗ ██╔╝██╔════╝██╔══██╗    
    ██████╔╝██║     ███████║ ╚████╔╝ █████╗  ██████╔╝    
    ██╔═══╝ ██║     ██╔══██║  ╚██╔╝  ██╔══╝  ██╔══██╗    
    ██║     ███████╗██║  ██║   ██║   ███████╗██║  ██║    
    ╚═╝     ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝    
                                                        
        ██╗    ██╗██╗███╗   ██╗███████╗██╗██╗██╗         
        ██║    ██║██║████╗  ██║██╔════╝██║██║██║         
        ██║ █╗ ██║██║██╔██╗ ██║███████╗██║██║██║         
        ██║███╗██║██║██║╚██╗██║╚════██║╚═╝╚═╝╚═╝         
        ╚███╔███╔╝██║██║ ╚████║███████║██╗██╗██╗         
        ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚══════╝╚═╝╚═╝╚═╝         

  PLR
end

class Board
  attr_reader :squares

  WINNIG_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                 [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                 [[1, 5, 9], [3, 5, 7]]              # diags

  def initialize
    @squares = {}
    reset
  end

  def reset
    (1..9).each { |key| squares[key] = Square.new }
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    squares.keys.select { |key| squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNIG_LINES.each do |line|
      squares_on_line = squares.values_at(*line)
      if three_identical_markers?(squares_on_line)
        return squares_on_line.first.marker
      end
    end
    nil
  end

  def detect_near_win(player_marker)
    move = nil
    WINNIG_LINES.each do |line|
      squares_on_line = squares.values_at(*line)
      if squares_on_line.count { |square| square.marker == player_marker } == 2 && 
        squares_on_line.count(&:unmarked?) == 1
        move = unmarked_keys.select { |v| line.include?(v) }.first
      end
    end
    move
  end

  def center_open?
    squares[5].unmarked?
  end

  # rubocop:disable Metrics/AbcSize/MethodLength
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_reader :marker, :name
  attr_accessor :score

  def initialize(marker, name)
    @marker = marker
    @name = name
    @score = 0
  end

  def winner?
    @score == 5
  end

  def point
    self.score += 1
  end
end

class TTTGame
  include Banners

  attr_reader :board, :human, :computer, :first_to_move
  attr_accessor :current_marker, :round

  def initialize
    @board = Board.new
    @human = nil
    @computer = nil
    @first_to_move = nil
    @current_marker = nil
    @round = nil
  end

  def name?
    puts 'Whats your name?'
    name = nil
    loop do
      name = gets.chomp
      break unless name.empty?
      puts 'Please enter a name'
    end
    @name = name.capitalize
  end

  def computer_name
    ['Hal', 'Skynet', "Chappie", 'Wall-E', 'Eva'].sample
  end

  def who_goes_first?
    puts "Who goes first? (1) #{human.name} or (2) #{computer.name}"
    answer = nil
    loop do
      answer = gets.chomp
      break if ['1', '2'].include?(answer)
      puts "Please enter 1 for #{human.name} or 2 for #{computer.name}"
    end
    answer == '1' ? human.marker : computer.marker
  end

  def set_peices
    peice = nil
    loop do
      puts "Please choose a piece 'X' or 'O'"
      peice = gets.chomp.upcase
      break if ['X', 'O'].include?(peice)
      puts 'Invalid choice..'
    end

    if peice == 'X'
      peices = ["X", "O"]
    else
      peices = ["O", "X"]
    end

    peices
  end

  def set_game
    name = name?
    peices = set_peices
    @human = Player.new(peices[0], name)
    @computer = Player.new(peices[1], computer_name)
    @first_to_move = who_goes_first?
    @current_marker = @first_to_move
    @round = 0
  end

  def play
    clear
    display_welcome_message
    set_game
    main_game
    display_goodbye_message
  end

  private

  def main_game
    loop do
      play_rounds
      display_winner
      reset_score
      break unless play_again?
      display_play_again_message
    end
  end

  def play_rounds
    loop do
      display_board
      player_move
      update_display
      display_result
      reset_round
      break if game_over?
    end
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def display_winner
    if computer.winner?
      puts WIN_COMPUTER
    else
      puts WIN_PLAYER
    end
  end

  def update_display
    case board.winning_marker
    when human.marker
      human.point
    when computer.marker
      computer.point
    end
    self.round += 1
  end

  def game_over?
    @computer.winner? || @human.winner?
  end

  def display_welcome_message
    puts <<~MSG

    #{BANNER}                     
    
                First player to win 5 rounds wins the game
        Each square is associated with a number from 1-9 like this.. 


                                1 | 2 | 3
                                ---------
                                4 | 5 | 6
                                ---------
                                7 | 8 | 9


    MSG
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_board
    system "clear"
    puts <<~MSG
       _____________________________________
      |            TIC-TAC-TOE              |
      |  #{human.marker} #{standardize_name(human)}        Round: #{round}    |      
      |  #{computer.marker} #{standardize_name(computer)}                    |    
      \\_____________________________________/  
        |  _____________________________  |
        | | First to 5 wins             | |
        | |                             | |
        | |         #{board.squares[1]} | #{board.squares[2]} | #{board.squares[3]}           | |
        | |        -----------          | |
        | |         #{board.squares[4]} | #{board.squares[5]} | #{board.squares[6]}           | |
        | |        -----------          | |
        | |         #{board.squares[7]} | #{board.squares[8]} | #{board.squares[9]}           | |
        | |_____________________________| |
        |_________________________________|
       /         +           *  *          \\
      /_____________________________________\\
  MSG
  end

  def standardize_name(player)
    name_and_score = "#{player.name} #{player.score}"

    if name_and_score.size > 14
      "#{player.name[0..8]}.. #{player.score}"
    else
      name_and_score.ljust(13)
    end
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_moves
    puts "Chose a sqaure: #{joinor(board.unmarked_keys)}"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice"
    end

    board[square] = human.marker
  end

  def joinor(array, delimiter=', ', last_word="or")
    case array.length
    when 0 then ''
    when 1 then array.first.to_s
    when 2 then array.join(" #{last_word} ")
    else
      array[-1] = "#{last_word} #{array.last}"
      array.join(delimiter)
    end
  end

  def computer_moves
    attacking_move = board.detect_near_win(computer.marker)
    defensive_move = board.detect_near_win(human.marker)

    open_square = if attacking_move
                    attacking_move
                  elsif defensive_move
                    defensive_move
                  elsif board.center_open?
                    5
                  else
                    board.unmarked_keys.sample
                  end

    board[open_square] = computer.marker
  end

  def display_result
    clear_screen_and_display_board
    case board.winning_marker
    when human.marker
      puts "#{human.name} won the round!"
    when computer.marker
      puts "#{computer.name} won the round!"
    else
      puts "It's a tie!"
    end

    puts 'Press enter for next round...'
    gets
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def clear
    system 'clear'
  end

  def reset_round
    board.reset
    self.current_marker = @first_to_move
    clear
  end

  def reset_score
    human.score = 0
    computer.score = 0
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ''
  end

  def current_player_moves
    if human_turn?
      human_moves
      self.current_marker = computer.marker
    else
      computer_moves
      self.current_marker = human.marker
    end
  end

  def human_turn?
    current_marker == human.marker
  end
end

game = TTTGame.new
game.play
