class Card

  include Comparable

  def self.faces
    ("2".."10").to_a + %w(J Q K A)
  end

  def self.suits
    %w(Clubs Diamonds Hearts Spades)
  end

  attr_accessor :suit, :face, :value

  def initialize(face, suit)
    @suit = suit
    @face = face.to_s
    @value = find_value
  end

  def find_value
    if face.to_i != 0
      then face.to_i
    elsif face == "Ace" then 11
    else 10
    end
  end

  def +(other)
      value + other.value
  end

  def <=>(other)
    if other.is_a? Card
      value <=> other.value
    else
      super(other)
    end
  end

  def to_s
    "a #{face} of #{suit}"
  end

end
