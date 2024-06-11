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
        @moves = generate_moves

    end

    def inside?(pos)
        super
    end

    def valid?(current, next_pos)
        if inside?(next_pos)
            return true ? current[0] == next_pos[0] || current[1] == next_pos[1] : false
        end    
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

    def move(next_pos)
        if valid?(@current_pos, next_pos)
            @current_pos = next_pos
            @board.update_cell(next_pos, @symbol)
        end
    end
end

r = Rook.new("white", 1)
p r.moves