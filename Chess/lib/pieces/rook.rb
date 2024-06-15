require_relative 'piece'


class Rook < Piece
    attr_reader :number, :possible_pos
    def initialize(color, number, initial_pos = [])
        super
        @color = color
        @symbol = (color == "white" ? "\u265C" : "\u2656").encode
        @possible_pos = {
            "white" => [[7,0],[7,7]],
            "black" => [[0,0], [0,7]]
        }
        #Used for testing, if initial_pos specified, we take it
        #If not we take it from possible_pos via number
        @initial_pos = initial_pos.empty? ? (color == "white" ? @possible_pos["white"][number - 1] : @possible_pos["black"][number - 1]) : initial_pos
        @current_pos = @initial_pos
        @moves = generate_moves
        @board = $board

    end

    def inside?(pos)
        super
    end

    def valid?(current, next_pos)
        return true ? current[0] == next_pos[0] || current[1] == next_pos[1] : false
    end

    def move(next_pos)
        super
    end

    def to_s
        super    
    end

    def generate_moves
        initial_row = current_pos[0]
        initial_col = current_pos[1]
        

        @board.grid.each_with_index do |row, index|
            p row
            #p @board.grid[index][initial_col] != "." && @board.grid[index][initial_col] != @symbol                
            moves.push([index, initial_col]) if index != initial_row

            #p @board.grid[initial_row][index] != "." && @board.grid[initial_row][index] != @symbol 
            moves.push([initial_row, index]) if index != initial_col
        end
        moves
    end
end



white_rook = Rook.new("white", 1, [4,3])
$board.update_cell(white_rook.current_pos, white_rook.symbol)
obstacle_enemy_rook = Rook.new("black", 1, [5,3])
$board.update_cell(obstacle_enemy_rook.current_pos, obstacle_enemy_rook.symbol)

$board.display
p white_rook.moves