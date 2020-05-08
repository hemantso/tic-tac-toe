#!/usr/bin/env ruby

require_relative '../lib/board.rb'

class User
  def initialize
    @game = Board.new
    @board = @game.init_board(9)
  end

  def welcome
    puts '==========TIC-TAC-TOE=========='
    puts '-------------INSTRUCTIONS---------------'
    puts 'The first player is X'
    puts 'Choose numbers from 1 to 9 to select desired cell'
    puts 'No duplicate numbers are allowed'
    puts '--------------------------------'

    puts 'Player 1 please enter your name: '
    p1 = gets.chomp

    puts 'Player 2 please enter your name: '
    p2 = gets.chomp

    puts "Player 1: #{p1}, Token: X"
    puts "Player 2: #{p2}, Token: O"

    p "Here's the board"
    display_board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "

    puts ' ---------- '

    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "

    puts ' ---------- '

    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def turn
    current = @game.current_player
    puts "Player #{current}, choose a spot between 1-9"
    spot = gets.strip
    spot = @game.input_to_index(spot)
    if spot.between?(0, 8) == false
      puts 'Please enter a valid input between 1-9'
      return turn
    elsif @game.valid_move?(spot)
      @game.move(spot, @game.current_player)
    else
      puts 'This spot has been taken choose another spot'
      return turn
    end
    display_board
  end

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
