require_relative 'board'
require_relative './pieces/piece'
require_relative './pieces/rook'
require_relative './pieces/bishop'

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
        result << b1w = Bishop.new("white", 1)
        result << b1b = Bishop.new("black", 1)
        result << b2w = Bishop.new("white", 2)
        result << b2b = Bishop.new("black", 2)
        result
    end

    def place_pieces
        insert_pieces
        pieces.each do |piece|
            @board.update_cell([piece.current_pos[0],piece.current_pos[1]],piece.symbol)
        end
    end
end
