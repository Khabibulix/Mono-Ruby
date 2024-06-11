require_relative 'piece'

class Rook < Piece
    def initialize(color)
        super
        @symbol = color == "white" ? "\u265C" : "\u2656"
    end
end


