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

    def valid?(current, next_pos)
        patterns.each do |pattern|
            if current[0] + pattern[0] == next_pos[0] 
                if current[1] + pattern[1] == next_pos[1]
                   return true 
                end
            end
        end
        return false
    end

end
