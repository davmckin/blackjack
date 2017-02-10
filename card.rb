class Card

include Comparable

  attr_accessor  :suit, :face, :value

  def initialize (value, suit)
   self.value = value if value < 11
   self.value = 10 if value > 10 && value != 14
   self.value = 11 if value == 14
   self.suit = suit
   self.face=(value)
  end

 def face=(value)
   faces = %w(0 1 2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
   @face = faces[value]
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

end
