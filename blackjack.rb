require_relative 'card'
require_relative 'deck'
require 'tty'

class Game

attr_accessor :shoe, :player_hand, :dealer_hand, :prompt

  def initialize
    @shoe = Deck.new
    @player_hand = [].inject(:+)
    @dealer_hand = [].inject(:+)
    @prompt = TTY::Prompt.new
    2.times do
      @player_hand << deck.draw
      @dealer_hand << deck.draw
    end
  end

  def play
    until  player_hand >= 21 || stay
      player_turn
      hit
      dealer_turn
    end
    game_over
  end

  def player_turn
    puts "You have:"
    player_hand.each do |card|
      puts card
    end
  end

    def hit
      desire = prompt.yes?("Would you like another card?")
      if desire
        #move a card from the deck into the player_hand.
      else
        dealer_turn
      end
    end

  def dealer_turn
    if dealer_hand > 15
      game_over
    else
      hit
    end
  end

  def game_over
    if dealer_hand >= player_hand && dealer_hand != > 21
      puts "You lost."
    else
      puts "YOU WON!"
    end

  end
