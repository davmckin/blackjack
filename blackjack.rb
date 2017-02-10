require_relative 'card'
require_relative 'deck'
require 'tty'

class Game

attr_accessor :deck,
              :player_hand,
              :dealer_hand,
              :prompt

  def initialize(deck = Deck.new)
    @deck = Deck.new
    @player_hand = []
    @dealer_hand = []
    @prompt = TTY::Prompt.new
    2.times do
      @player_hand << hit
      @dealer_hand << hit
    end
  end
end

def play
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
  if desire.downcase == 'y'
    player_hand << hit
    play
  else
    dealer_turn
  end
end

  def hit
    new_card = deck.shift
    new_card
  end

def dealer_turn
  until dealer_hand > 15
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

Game.new.play
