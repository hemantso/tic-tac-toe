require './lib/board.rb'
require './bin/main.rb'

describe User do
  let(:game) { Board.new }
  let(:board) { game.init_board(9) }
end
