#!/usr/bin/env ruby
class Game
  attr_accessor :board
  def initialize
    @board = []
  end

  def start
    puts 'Hello! Welcome to Tic-Toc-Toe Game'
    puts 'What is your name Player One?'
    player1 = gets.chomp
    puts 'What is your name Player Two?'
    player2 = gets.chomp
    puts "Player 1: #{player1}, Token: X"
    puts "Player 2: #{player2}, Token: O"
    puts "Let's Play!"
    turn = 1.to_i
    while turn < 10
      if turn.odd?
        puts "#{player1} choose no. 1 to 9"
        # store input in board
      else
        puts "#{player2} choose no. 1 to 9"
        # store input in board
      end
      turn += 1
    end
  end
end

tic = Game.new
tic.start
