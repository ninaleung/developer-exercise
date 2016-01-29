class Card
  attr_accessor :suite, :name, :value

  def initialize(suite, name, value)
    @suite, @name, @value = suite, name, value
  end
end

class Deck
  attr_accessor :playable_cards
  SUITES = [:hearts, :diamonds, :spades, :clubs]
  NAME_VALUES = {
    :two   => 2,
    :three => 3,
    :four  => 4,
    :five  => 5,
    :six   => 6,
    :seven => 7,
    :eight => 8,
    :nine  => 9,
    :ten   => 10,
    :jack  => 10,
    :queen => 10,
    :king  => 10,
    :ace   => 1}

  def initialize
    shuffle
  end

  def deal_card
    random = rand(@playable_cards.size)
    return @playable_cards[random]
    @playable_cards.delete_at(random)
  end

  def shuffle
    @playable_cards = []
    SUITES.each do |suite|
      NAME_VALUES.each do |name, value|
        @playable_cards << Card.new(suite, name, value)
      end
    end
  end
end

class Hand
  attr_accessor :cards, :total, :ace_present

  def initialize
    @cards = []
  end

  def hit(deck)
    card = deck.deal_card
    @cards << card
  end

  def total
    @total = 0
    @cards.each do |card|
      @total += card.value
      if card.name == :ace
          @ace_present = true
      end
    end
    if @ace_present && (@total < 12)
      @total += 10
    end
    @total
  end

end

class Game
  attr_accessor :player_hand, :dealer_hand

  def initialize
    @deck = Deck.new
    @player_hand = Hand.new
    2.times { @player_hand.hit(@deck) }
    @dealer_hand = Hand.new
    2.times { @dealer_hand.hit(@deck) }
  end

  def dealer_top_card
    puts "Dealer's showing card:"
    puts @dealer_hand.cards[1].suite
    puts @dealer_hand.cards[1].name
    @dealer_hand.cards[1]
  end

  def player_on_initial_hand
    if @player_hand.total > 21
      puts "Player busts!"
    elsif @player_hand.total == 21
      puts "Player blackjack!"
    else
      puts "Player can hit or wait for dealer"
    end
  end

end

require 'test/unit'

class CardTest < Test::Unit::TestCase
  def setup
    @card = Card.new(:hearts, :ten, 10)
  end
  
  def test_card_suite_is_correct
    assert_equal @card.suite, :hearts
  end

  def test_card_name_is_correct
    assert_equal @card.name, :ten
  end
  def test_card_value_is_correct
    assert_equal @card.value, 10
  end
end

class DeckTest < Test::Unit::TestCase
  def setup
    @deck = Deck.new
  end
  
  def test_new_deck_has_52_playable_cards
    assert_equal @deck.playable_cards.size, 52
  end
  
  def test_dealt_card_should_not_be_included_in_playable_cards
    card = @deck.deal_card
    assert(@deck.playable_cards.include?(card))
  end

  def test_shuffled_deck_has_52_playable_cards
    @deck.shuffle
    assert_equal @deck.playable_cards.size, 52
  end
end

class HandTest < Test::Unit::TestCase
  def setup
    @deck = Deck.new
    @hand = Hand.new
  end

  def test_hit_has_1_card
    @hand.hit(@deck)
    assert_equal @hand.cards.size, 1
  end

  def test_hit_twice_has_2_cards
    2.times { @hand.hit(@deck) }
    assert_equal @hand.cards.size, 2
  end

  def test_hand_total_for_two_cards
    2.times { @hand.hit(@deck) }
    if @hand.total > 11 && @hand.ace_present
      assert_equal @hand.total, (@hand.cards[0].value + @hand.cards[1].value) + 10
    else
      assert_equal @hand.total, (@hand.cards[0].value + @hand.cards[1].value)
    end
  end

  def test_hand_total_for_three_cards
    3.times { @hand.hit(@deck) }
    values_of_cards = (@hand.cards[0].value + @hand.cards[1].value + @hand.cards[2].value)
    if values_of_cards < 12 && @hand.ace_present
      assert_equal @hand.total, (@hand.cards[0].value + @hand.cards[1].value + @hand.cards[2].value) + 10
    else
      assert_equal @hand.total, (@hand.cards[0].value + @hand.cards[1].value + @hand.cards[2].value)
    end
  end
end

class GameTest < Test::Unit::TestCase
  def setup
    @game = Game.new
  end

  def test_player_hand_has_2_cards
    assert_equal @game.player_hand.cards.size, 2
  end

  def test_dealer_hand_has_2_cards
    assert_equal @game.dealer_hand.cards.size, 2
  end

  def test_dealer_top_card
    dealer_showing = @game.dealer_hand.cards[1]
    assert_equal dealer_showing, @game.dealer_top_card
  end

  def test_player_on_initial_hand
    @game.player_on_initial_hand
  end

end