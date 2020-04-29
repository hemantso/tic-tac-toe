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
]
def start
  puts 'Hello! Welcome to Tic-Toc-Toe Game'
    puts 'What is your name Player One?'
    player1 = gets.chomp.upcase
    puts 'What is your name Player Two?'
    player2 = gets.chomp.upcase
    puts "#{player1} Please choose your symbol between X or O"
    player1_symbol = gets.chomp
    player2_symbol = ''
    until player1_symbol.include?('X') || player1_symbol.include?('O')
      if player1_symbol != 'X' || player1_symbol != 'O'
        puts 'Wrong symbol choosen please try again'
        player1_symbol = gets.chomp
      end
    end
      if player1_symbol.include?('X')
        player2_symbol = 'O'
      else
        player2_symbol = 'X'
      end
    puts "Let's Play!" 
    
    until over?
      turn(player2_symbol, player1_symbol)
    end

    if won?
      winner = winner()
      if winner == player1_symbol
      puts "Congratulations #{player1} you won!"
      else
        puts "Congratulations #{player2} you won!"
      end
    elsif draw?
      puts "Game draw!"
    end
  end


  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts " ----------- "
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts " ----------- "
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(position, token='X')
    @board[position] = token
  end

  def position_taken?(input)
    if @board[input] == "X" || @board[input] == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(input)
    input.between?(0, 8) && !position_taken?(input)
  end


  def turn(p1, p2)
    puts "Choose a spot between 1-9"
    spot = gets.strip
    spot = input_to_index(spot)
    if valid_move?(spot)
      move(spot, current_player(p1, p2))
    else
      turn(p1, p2)
    end
    display_board
  end

  def turn_count
    count = 0
    @board.each do |i|
      if i == "X" || i == "O"
        count += 1
      end
    end
    return count
  end

  def current_player(pl1, pl2)
    player = '' 
    if turn_count() % 2 == 0
      player = pl2
    else
      player = pl1
    end
    return player
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
    won = ""
    if winner = won?
      won = @board[winner.first]
    end
  end
    
end

game = Game.new
game.start

