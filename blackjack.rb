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
    @desire = true
    @prompt = TTY::Prompt.new
    deal
    read_hands
  end

  #defined deal as a method to cleanup initialize method
  def deal
    2.times do
      @player_hand << deck.cards.shift
      @dealer_hand << deck.cards.shift
    end
  end

  #defined read hands to pull it out of player_turn and dealer_turn and also check for dealer 21
  def read_hands
    if dealer_hand.inject(0) {|sum, card| sum + card.value} == 21
      puts "The dealer gave himself a blackjack off the deal. What a cheater!"
    else
      puts "The dealer has #{dealer_hand[0]} face up"
    end
    puts "You have:"
      player_hand.each {|card| puts card}
  end

  def play
    until player_hand.inject(0) {|sum, card| sum + card.value} >= 21 do player_turn || @desire = false
    end
    dealer_turn
  end

  def player_turn
      hit_y_n = prompt.yes?("Would you like to hit? y/n")
      if hit_y_n
        player_hand << deck.cards.shift
        puts "You drew #{player_hand.last}"
      else
        @desire = false
        dealer_turn
      end
  end

  def dealer_turn
    puts "The dealer has #{dealer_hand[0]} and #{dealer_hand[1]}" #added dealer_hand read out
    dealer_hand.inject(0) {|sum, card| sum + card.value}
    until dealer_hand.inject(0) {|sum, card| sum + card.value} > 15
      dealer_hand << deck.cards.shift
      puts "They drew #{dealer_hand.last}"
    end
    game_over
  end

  def rematch
    desire = prompt.yes?("Would you like a rematch?")
    if desire
      Game.new.play
    else
      puts "Good try, maybe you'll make more money at another table."
      exit
    end
  end

  def player_hand_value
    player_hand.inject(0) {|sum, card| sum + card.value}
  end

  def dealer_hand_value
    dealer_hand.inject(0) {|sum, card| sum + card.value}
  end

  def game_over
    if player_hand.inject(0) {|sum, card| sum + card.value} > 21
      puts "You lose, the dealer had #{dealer_hand_value} and you had #{player_hand_value}"
    elsif player_hand.inject(0) {|sum, card| sum + card.value} == dealer_hand.inject(0) {|sum, card| sum + card.value}
      puts "You tied, but that technically means you win!"
    elsif player_hand.inject(0) {|sum, card| sum + card.value} > dealer_hand.inject(0) {|sum, card| sum + card.value}
      puts "You win, the dealer only had #{dealer_hand_value} and you had #{player_hand_value}"
    else
      puts "you lose"
    end
    rematch
  end

end

Game.new.play
