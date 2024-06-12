require_relative 'piece'


class Rook < Piece
    attr_accessor :choices_for_black, :choices_for_white
    attr_reader :number
    def initialize(color, number)
        super
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


    def generate_moves
        super
    end

    def move(next_pos)
        super
    end

end