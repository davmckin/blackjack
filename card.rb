class Card

include Comparable

  attr_accessor  :suit, :face, :value

  def initialize (value, suit)
   @value = value
   @suit = suit
   @face = value.to_s
  end

 def face=(value)
   if @face == 11
    then "Jack"
   elsif @face == 12
    then "Queen"
   elsif @face == 13
    then "King"
   elsif @face == 14
    then "Ace"
   else
    value
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

end
