=begin 
Twenty-One is a card game consisting of a dealer and a player where the participants try to get as close to 21 as possible without going over.

Here is an overview of the game:
  - Both participants are initally dealt 2 cards from a 52-card deck 
  - The player take the first turn, and can "hit" or "stay"
  - If the player busts, he loses. If he stays, it's the dealer's turn.
  - The dealer must hit until his cards add up to at least 17. 
  - If he busts, the player wins. If both the player and dealer stays, then the highest total wins.
  - If both totals are equal, then it's a tie and nobody wins.

Nouns 
  - Dealer, player, game, participant, card, deck, total?

Verbs 
  - dealt, turn, hit, stay, bust, lose/win, total

player 


dealer 


particapant 
  @name 
  @cards 
  @total 
  @busted?
  - total(cards)
  - busted(cards)
  - hit or stay(cards)


game 
  @deck 
  @player
  @dealer 

  - deal 
  - 





=end 




class Player 
  attr_accessor :hand, :total, :busted
  def initialize
    @hand = []
    @total = 0 
  end 

  def busted?
    total > 21 
  end 

  def add_card_to_hand(card) 
    hand << card
  end 

  def calcuate_total
    self.total = 0
    values = hand.map { |card| card.value }
  
    values.each do |value|
      if value == 'A'
        self.total += 11
      elsif value.to_i == 0
        self.total += 10
      else
        self.total += value.to_i
      end
    end
  
    values.select { |value| value == "A" }.count.times do
      self.total -= 10 if total > 21
    end
    
    total
  end
  
  def display_hand
    copy = hand.dup
    case copy.length
    when 0 then ''
    when 1 then copy.first.to_s
    when 2 then copy.join(" and ")
    else
      copy[-1] = "and #{copy.last}"
      copy.join(', ')
    end
  end 

    # - total(cards)
    # - busted(cards)
    # - hit or stay(cards)
end 

class Card
  attr_accessor :value, :suit 
  def initialize(value, suit)
    @value = value 
    @suit = suit
  end 

  def to_s 
    "#{value} of #{suit}"
  end 
end 

class Deck 
  VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  SUIT = %w(Hearts Diamonds Spades Clubs)

  attr_accessor :cards

  def initialize
    @cards = new_deck 
  end 

  def new_deck
    deck = VALUES.product(SUIT).shuffle
    deck.map do |value, suit|
      Card.new(value, suit)
    end 
  end 

  def deal_card
   cards.shift 
  end 
end


class Game
  attr_accessor :player, :dealer, :deck
  def initialize
    @player = Player.new
    @dealer = Player.new 
    @deck = Deck.new 
  end 

  def start
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end

  def deal_cards
    2.times do 
      player.add_card_to_hand(deck.deal_card)
      dealer.add_card_to_hand(deck.deal_card)
    end 
  end 

  def show_initial_cards
    puts "Dealer has #{dealer.hand[0]} and ?"
    puts "Player has #{player.display_hand} for a total of #{player.calcuate_total}"
  end 

  def player_turn
    loop do
      answer = nil 
      loop do 
        puts 'Hit or Stay'
        answer = gets.chomp.downcase
        break if ['hit', 'stay'].include?(answer)
        print 'Invalid choice please enter: '
      end 

      break if answer == 'stay'
      player.add_card_to_hand(deck.deal_card)
      puts "Player has #{player.display_hand} for a total of #{player.calcuate_total}"
      break if player.busted?
    end 
  end 


  def dealer_turn
    loop do 
      puts "Dealer has #{dealer.display_hand} for a total of #{dealer.calcuate_total}"
      break if dealer.calcuate_total >= 17 or dealer.busted?
      puts 'Hit'
      dealer.add_card_to_hand(deck.deal_card)
    end 
  end 

  def show_result
    puts ''
    puts "Player has #{player.display_hand} for a total of #{player.calcuate_total}"
    puts "Dealer has #{dealer.display_hand} for a total of #{dealer.calcuate_total}"

    if player.busted
      puts 'Dealer wins'
    elsif dealer.busted
      puts 'Player wins!'
    elsif player.total > dealer.total
      puts 'Player wins!'
    elsif dealer.total > player.total
      puts 'Dealer wins'
    else 
      puts 'its a tie..'
    end 
  end

end

Game.new.start
