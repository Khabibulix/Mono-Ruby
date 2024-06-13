require_relative 'board'
require_relative './pieces/piece'
require_relative './pieces/rook'
# require_relative './pieces/bishop'

class Game
    attr_accessor :board, :pieces
    def initialize(board)
        @board = board
        @pieces = insert_pieces
    end

    def insert_pieces
        result = []
        result << r1w = Rook.new("white", 1)
        result << r2w = Rook.new("white", 2)
        result << r1b = Rook.new("black", 1)
        result << r2b = Rook.new("black", 2)
        # @pieces << b1w = Bishop.new("white", 1)
        # @pieces << b1b = Bishop.new("black", 1)
        # @pieces << b2w = Bishop.new("white", 2)
        # @pieces << b2b = Bishop.new("black", 2)
    end

    def place_pieces
        insert_pieces
        pieces.each do |piece|
            p piece.current_pos
            # @board.update_cell([piece.current_pos[0],piece.current_pos[1]],piece.symbol)
        end
    end
end

g = Game.new($board)
p g.pieces
g.place_pieces
