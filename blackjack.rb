require_relative 'card'
require_relative 'deck'
require 'tty'

class Game

attr_accessor :deck,
              :player_hand,
              :dealer_hand,
              :prompt

  def initialize
    @deck = Deck.new
    @player_hand = []
    @dealer_hand = []
    @prompt = TTY::Prompt.new
    @player_hand << @deck.cards.shift(2)
    @dealer_hand << @deck.cards.shift(2)
  end

def play
  player_hand
  until player_hand == 21
    player_turn
  end                   #needs bust method, show dealer card before first hit
  dealer_turn
end

def player_turn
  puts "You have:"
  player_hand.each do |card|
    puts card
  end
  desire = prompt.yes?("Would you like to hit? y/n")
  if desire == 'y'
    player_hand << hit
    play
  else
    dealer_turn
  end
end

def hit
  deck.shift
end

def dealer_turn
  dealer_total = 0
  dealer_hand.each do |card|
    card.value +dealer_total
  end
  until dealer_total > 15
    dealer_hand << hit
  end
  game_over
end

def game_over
  if player_hand > 21
    puts "you lose"
  elsif player_hand == dealer_hand
    puts "you win"
  elsif player_hand > dealer_hand
    puts "you win"
  else
    puts "you lose"
  end
end

end

Game.new.play
