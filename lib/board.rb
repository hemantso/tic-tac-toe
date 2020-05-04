class Board
  attr_accessor :board
  def initialize
    @board = nil
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

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
        @board[combo[1]] == @board[combo[2]] &&
        position_taken?(combo[0])
    end
  end

  def init_board(grid)
    @board = Array.new(grid) { '-' }
  end

  def position_taken?(input)
    if @board[input] == 'X' || @board[input] == 'O'
      true
    else
      false
    end
  end

  def current_player
    player = if (turn_count % 2).zero?
               'X'
             else
               'O'
             end
    player
  end

  def input_to_index(input)
    input.to_i - 1
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

  def move(position, token = 'X')
    @board[position] = token
  end

  def valid_move?(input)
    input.between?(0, 8) && !position_taken?(input)
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
end
