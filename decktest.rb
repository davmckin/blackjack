require 'minitest/autorun'
require_relative 'deck'

class DeckTest < MiniTest::Test

  def test_a_deck_has_52_cards
    deck = Deck.new
    assert_equal 52, deck.cards.length
    assert deck.cards.all?{|c| c.is_a? Card}
    puts deck.cards.inspect  
  end

end
