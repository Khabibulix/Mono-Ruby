require_relative 'piece'


class Queen < Piece
    attr_reader :number, :possible_pos, :symbol
    def initialize(color, number = 1, initial_pos = [])
        super
        @color = color
        @symbol = (color == "white" ? "\u2655" : "\u265B").encode
        # @possible_pos = {
        #     "white" => [7,2],
        #     "black" => [0,2]
        # }
        # @initial_pos = initial_pos.empty? ? (color == "white" ? @possible_pos["white"][number - 1] : @possible_pos["black"][number - 1]) : initial_pos
        # @current_pos = @initial_pos
        # @moves = generate_moves
    end
end