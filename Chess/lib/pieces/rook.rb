require_relative 'piece'


class Rook < Piece
    attr_accessor :choices_for_black, :choices_for_white
    attr_reader :number
    def initialize(color, number)
        super
        @symbol = color == "white" ? "\u265C" : "\u2656"
        @white_pos = [[7,0],[7,7]]
        @black_pos = [[0,0], [0,7]]
        @initial_pos = color == "white" ? @white_pos[number - 1] : @black_pos[number - 1]
        @current_pos = initial_pos if @current_pos.empty?
        @board = $board

    end

    def valid?(current, next_pos)
        return true if current[0] == next_pos[0] || current[1] == next_pos[1]
        false
    end


    def move(next_pos)
        if valid?(@current_pos, next_pos)
            @current_pos = next_pos
            @board.update_cell(next_pos, @symbol)
        end
    end
end