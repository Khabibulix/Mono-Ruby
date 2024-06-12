require_relative 'piece'


class Rook < Piece
    attr_accessor :choices_for_black, :choices_for_white
    attr_reader :number
    def initialize(color, number)
        super
        @color = color
        @symbol = color == "white" ? "\u265C" : "\u2656"
        @possible_pos = {
            "white" => [[7,0],[7,7]],
            "black" => [[0,0], [0,7]]
        }
        @initial_pos = color == "white" ? @possible_pos["white"][number - 1] : @possible_pos["black"][number - 1]
        @current_pos = initial_pos if @current_pos.empty?
        @board = $board
        @moves = generate_moves

    end

    def inside?(pos)
        super
    end

    def valid?(current, next_pos)
        super
    end

    def move(next_pos)
        super
    end

    def to_s
        return "There is a #{@color} #{self.class.name} located at #{@current_pos}"
    end

    def generate_moves
        initial_row = current_pos[0]
        initial_col = current_pos[1]

        @board.grid.each_with_index do |row, index|
                moves.push([index, initial_col]) if index != initial_row
                moves.push([initial_row, index]) if index != initial_col
        end
        moves
    end
end

r = Rook.new("white", 1)
p r.to_s