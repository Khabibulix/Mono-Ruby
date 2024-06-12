require_relative 'lib/game'

g = Game.new($board)
g.place_pieces
g.board.display