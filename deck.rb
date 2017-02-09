require_relative 'card'

class Deck

  attr_accessor :cards

  def initialize
    @cards = []
    suits = %w(hearts diamonds spades clubs)
    suits.each do |s|
      (2..10).each do |f|
        @cards << Card.new(f, s)
      end
      @cards << Card.new(suit, 10, "J")
      @cards << Card.new(suit, 10, "Q")
      @cards << Card.new(suit, 10, "K")
      @cards << Card.new(suit, 11, "A")
    end
    shuffle
  end

  def shuffle
    self.cards.shuffle!
  end

end
