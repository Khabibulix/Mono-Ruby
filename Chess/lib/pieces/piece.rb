class Piece
    attr_accessor :current_pos, :moves
    attr_reader :color, :symbol, :initial_pos, :pattern
    def initialize(color)
        @color = color
        @symbol = ""
        @initial_pos = []
        @current_pos = []
        @moves = []
        @pattern = []
    end

end
