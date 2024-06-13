require_relative 'piece'
require_relative 'rook'
require_relative 'bishop'


class Queen < Piece
    attr_reader :number, :possible_pos, :symbol
    def initialize(color, number = 1, initial_pos = [])
        super
        @color = color
        @symbol = (color == "white" ? "\u2655" : "\u265B").encode
        @initial_pos = initial_pos.empty? ? (color == "white" ? [7,3] : [0,3]) : initial_pos
        @current_pos = @initial_pos
        @moves = generate_moves
    end
    
    def generate_moves
        moves_for_bishop = Bishop.new("white", 1 , current_pos).generate_moves
        moves_for_rook = Rook.new("white", 1, current_pos).generate_moves
        return (moves_for_bishop + moves_for_rook).sort.uniq
    end
end