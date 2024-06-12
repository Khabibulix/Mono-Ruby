require_relative 'board'
require_relative './pieces/piece'
require_relative './pieces/rook'

class Game
    attr_accessor :board, :pieces
    def initialize(board)
        @board = board
        @pieces = []
    end

    def insert_pieces
        @pieces << r1w = Rook.new("white", 1)
        @pieces << r2w = Rook.new("white", 2)
        @pieces << r1b = Rook.new("black", 1)
        @pieces << r2b = Rook.new("black", 2)
    end

    def place_pieces
        insert_pieces
        pieces.each do |piece|
            @board.update_cell([piece.current_pos[0],piece.current_pos[1]],piece.symbol)
        end
    end
end

g = Game.new($board)
g.place_pieces
g.board.display