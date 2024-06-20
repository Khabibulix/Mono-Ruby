require_relative 'piece'
require_relative '../board'


class Rook < Piece
    attr_reader :number, :possible_pos, :board
    def initialize(color, number, initial_pos = [])
        super
        @color = color
        @symbol = (color == "white" ? "\u265C" : "\u2656").encode
        @possible_pos = {
            "white" => [[7,0],[7,7]],
            "black" => [[0,0], [0,7]]
        }
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

    def move(next_pos, board = @board)
        if moves.include?(next_pos)
            p "included"
            if valid?(@current_pos, next_pos)
                p "valid"
                @current_pos = next_pos
                @board.update_cell(next_pos, @symbol)
            end
        end
    end

    def to_s
        super    
    end

    def generate_top_column(pos, board=@board)
        result = []        
        7.times do           
            pos = [pos[0] - 1, pos[1]]
            if inside?(pos)
                if board.grid[pos[0]][pos[1]] == "."
                    result << pos
                else
                    return result.sort
                end
            end
        end
        result.sort
    end

    def generate_bottom_column(pos, board=@board)
        result = []        
        7.times do           
            pos = [pos[0] + 1, pos[1]]
            if inside?(pos)
                if board.grid[pos[0]][pos[1]] == "."
                    result << pos
                else
                    return result.sort
                end
            end
        end
        result.sort
    end

    def generate_left_row(pos, board = @board)
        result = []        
        7.times do           
            pos = [pos[0], pos[1] - 1]
            if inside?(pos)
                if board.grid[pos[0]][pos[1]] == "."
                    result << pos
                else
                    return result.sort
                end
            end
        end
        result.sort
    end

    def generate_right_row(pos, board = @board)
        result = []        
        7.times do           
            pos = [pos[0], pos[1] + 1]
            if inside?(pos)
                if board.grid[pos[0]][pos[1]] == "."
                    result << pos
                else
                    return result.sort
                end
            end
        end
        result.sort
    end

    def generate_moves(board = @board)
        row = generate_left_row(current_pos, board) + generate_right_row(current_pos, board)
        col = generate_top_column(current_pos, board) + generate_bottom_column(current_pos, board)
        (row + col).sort
    end
end


r = Rook.new("white", 1, [4,3])