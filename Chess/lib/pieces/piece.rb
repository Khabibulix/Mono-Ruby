require_relative '../board'

class Piece
    attr_accessor :current_pos, :moves, :board
    attr_reader :color, :symbol, :initial_pos, :patterns
    def initialize(color, number = 1)
        @color = color
        @symbol = ""
        @initial_pos = []
        @current_pos = []
        @moves = []
        @patterns = []
        @number = number
        @board = $board
    end

    def inside?(pos)
        return true ? pos[0].between?(0,8) && pos[1].between?(0,8) : false
    end
end
