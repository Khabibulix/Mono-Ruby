require_relative 'piece'


class Bishop < Piece
    attr_reader :number, :possible_pos, :symbol
    def initialize(color, number)
        super
        @color = color
        @symbol = (color == "white" ? "\u2657" : "\u265D").encode
        # @possible_pos = {
        #     "white" => [[7,0],[7,7]],
        #     "black" => [[0,0], [0,7]]
        # }
        # @initial_pos = color == "white" ? @possible_pos["white"][number - 1] : @possible_pos["black"][number - 1]
        # @current_pos = initial_pos if @current_pos.empty?
        # @board = $board
        # @moves = generate_moves

    end
end
