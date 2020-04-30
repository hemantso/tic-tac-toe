#!/usr/bin/env ruby
class Game
  attr_accessor :board
  def initialize
    @board = []
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [6, 4, 2],
    [0, 4, 8]
  ].freeze

  def start
    user_detail = user_info
    puts "Let's Play!"
    turn(user_detail[3], user_detail[2]) until over?
    result(user_detail[0], user_detail[1], user_detail[2])
  end

  def user_info
    puts 'Hello! Welcome to Tic-Toc-Toe Game'
    puts 'What is your name Player One?'
    player1 = gets.chomp.upcase
    puts 'What is your name Player Two?'
    player2 = gets.chomp.upcase
    puts "#{player1} Please choose your symbol between X or O"
    player1_symbol = gets.chomp
    until player1_symbol.include?('X') || player1_symbol.include?('O')
      if player1_symbol != 'X' || player1_symbol != 'O'
        puts 'Wrong symbol choosen please try again'
        player1_symbol = gets.chomp
      end
    end
    player2_symbol = player1_symbol.include?('X') ? 'O' : 'X'
    [player1, player2, player1_symbol, player2_symbol]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts ' ----------- '
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts ' ----------- '
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(position, token = 'X')
    @board[position] = token
  end

  def position_taken?(input)
    if @board[input] == 'X' || @board[input] == 'O'
      true
    else
      false
    end
  end

  def valid_move?(input)
    input.between?(0, 8) && !position_taken?(input)
  end

  def turn(play1, play2)
    puts 'Choose a spot between 1-9'
    spot = gets.strip
    spot = input_to_index(spot)
    if valid_move?(spot)
      move(spot, current_player(play1, play2))
    else
      turn(play1, play2)
    end
    display_board
  end

  def turn_count
    count = 0
    @board.each do |i|
      if i == 'X'
        count += 1
      elsif i == 'O'
        count += 1
      end
    end
    count
  end

  def current_player(playe1, playe2)
    turn_count.even? ? playe2 : playe1
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
        @board[combo[1]] == @board[combo[2]] &&
        position_taken?(combo[0])
    end
  end

  def full?
    turn_count == 9
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    winner = won?
    @board[winner.first]
  end

  def result(player1, player2, p1_symbol)
    if won?
      congo = winner
      if congo == p1_symbol
        puts "Congratulations #{player1} you won!"
      else
        puts "Congratulations #{player2} you won!"
      end
    elsif draw?
      puts 'Game draw!'
    end
  end
end
game = Game.new
game.start
