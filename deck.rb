require_relative 'card'

class Deck

  attr_accessor :cards

  def initialize
    @cards = []
    suits = %w(hearts diamonds spades clubs)
    suits.each do |s|
      (2..14).each do |f|
        @cards << Card.new(f, s)
      end
    end
    shuffle
  end

  def shuffle
    self.cards.shuffle!
  end

end
