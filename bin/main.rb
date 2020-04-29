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
    choose_symbol
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

  def choose_symbol
    puts 'player1: Please choose your symbol between X or O'
    player1_symbol = gets.chomp
    until player1_symbol.include?('X' || 'O')
      if player1_symbol != 'X' || player1_symbol != 'O'
        puts 'Wrong symbol choosen please try again'
        player1_symbol = gets.chomp
      end
    end
  end

  def display_board
    puts 'Position taken on Board'
    # Postion of board will shown here
  end

  def result
    game_on = true
    while game_on
      if winner
        puts 'Player is winner'
        game_on = false
      else
        puts "It's a draw"
      end
    end
  end
end

tic = Game.new
tic.start
