require_relative 'card'

class Deck

  attr_accessor :cards

  def initialize
    @cards = []
    build_deck
    shuffle!
  end

  #created a build_deck method to cleanup initialize
  def build_deck
    Card.suits.each do |s|
      Card.faces.each do |f|
        cards << Card.new(f, s)
      end
    end
  end

  def draw
    @cards.shift
  end

  def shuffle!
    cards.shuffle!
  end

end
