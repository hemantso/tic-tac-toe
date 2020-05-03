#!/usr/bin/env ruby
require './lib/board'
require './lib/game'

class User
  include Game
  def initialize
    @game = Board.new
    @board = @game.init_board(9)
  end

  # instructions to player
  def welcome
    puts '==========TIC-TAC-TOE=========='
    puts '-------------INSTRUCTIONS---------------'
    puts 'The first player is X'
    puts 'Choose numbers from 1 to 9 to select desired cell'
    puts 'No duplicate numbers are allowed'
    puts '--------------------------------'
    # Request for player names and save them to p1 and p2
    puts 'Player 1 please enter your name: '
    p1 = gets.chomp

    puts 'Player 2 please enter your name: '
    p2 = gets.chomp

    puts "Player 1: #{p1}, Token: X"
    puts "Player 2: #{p2}, Token: O"

    p "Here's the board"
    display_board
  end

  # Tic Tac Toe Board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "

    puts ' ---------- '

    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "

    puts ' ---------- '

    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # Game begins, player 1 starts choosing between 1-9
  # if the input is different valid_move returns false and input is request again
  def turn
    current = @game.current_player
    puts "Player #{current}, choose a spot between 1-9"
    spot = gets.strip
    spot = input_to_index(spot)
    if @game.valid_move?(spot)
      @game.move(spot, @game.current_player)
    else
      puts 'This spot hasbeen taken or you inputed a wrong value'
      puts 'Please enter a valid option between 1-9'
      display_board
      turn
    end
    display_board
  end

  # Turn method is called for players to fill the board until @game.over? method is true
  # If total moves = 9 and no combinations detected, its a draw, if a combination is detected, @game.won is executed
  def play
    turn until @game.over?
    if @game.won?
      puts "Congratulations #{@board[@game.won?.first]}! You Won"
    elsif @game.draw?
      puts "It's a draw!"
    end
  end
end

game = User.new
game.welcome
game.play
