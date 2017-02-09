class Card

include Comparable

  attr_accessor  :suit, :face, :value

  def initialize(face, suit)
    @suit = suit
    @face = face.to_s
    @value = find_value
  end

  def find_value
    self.class.faces.index(face)
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
