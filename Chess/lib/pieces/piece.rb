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

    #inside?[7,0] = true
    def inside?(pos)
        return true ? pos[0].between?(0,8) && pos[1].between?(0,8) : false
    end

    def valid?(current, next_pos)
        if inside?(next_pos)
            return true ? current[0] == next_pos[0] || current[1] == next_pos[1] : false
        end    
    end    


    def to_s
        return "There is a #{@color} #{self.class.name} located at #{@current_pos}"
    end

    def move(next_pos)
        if valid?(@current_pos, next_pos)
            @current_pos = next_pos
            @board.update_cell(next_pos, @symbol)
        end
    end
end
