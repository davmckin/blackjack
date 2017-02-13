# Added card tests to make sure the card class is working properly

require 'minitest/autorun'
require_relative 'card'

class CardTest < MiniTest::Test

  def setup
    @tcard = Card.new("A", "Spades")
  end

  def test_card_has_suit
    assert @tcard.suit
  end

  def test_card_has_face
    assert @tcard.face
  end
  #
  def test_card_has_value
    assert @tcard.value > 1
  end
  #
  def test_ace_value
    @tcard = Card.new("A", "Spades")
    assert @tcard.value == 11
  end
  #
  def test_king_value
    @tcard = Card.new("K", "Spades")
    assert @tcard.value == 10
  end
  #
  def test_queen_value
    @tcard = Card.new("Q", "Spades")
    assert @tcard.value == 10
  end
  #
  def test_jack_value
    @tcard = Card.new("J", "Spades")
    assert @tcard.value == 10
  end

  def test_cards_can_be_compared
    card1 = Card.new("J", "Spades")
    card2 = Card.new("4", "Spades")
    assert card1 > card2
  end

end
