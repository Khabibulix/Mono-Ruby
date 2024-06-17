require_relative 'piece'
require_relative '../board'


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
        # @moves = generate_moves
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

    def generate_top_column(pos, board)
        return [] if board.grid[pos[0] - 1][pos[1]] != "."
        result = []        
        pos[0].times do           
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

    def generate_bottom_column(pos)
        result = []
        8.times do    
            break if board.grid[pos[0]][pos[1]] != "." && board.grid[pos[0]][pos[1]] != @symbol
            pos = [pos[0] + 1, pos[1]]             
            inside?(pos) ? result.push(pos) : break                 
        end
        result.sort
    end

    def generate_left_row(pos)
        result = []
        8.times do
            break if board.grid[pos[0]][pos[1]] != "." && board.grid[pos[0]][pos[1]] != @symbol
            pos = [pos[0], pos[1] - 1]
            inside?(pos) ? result << pos : break
        end
        result.sort
    end

    def generate_right_row(pos)
        result = []
        8.times do
            break if board.grid[pos[0]][pos[1]] != "." && board.grid[pos[0]][pos[1]] != @symbol
            pos = [pos[0], pos[1] + 1]
            inside?(pos) ? result << pos : break
        end
        result.sort
    end

    # def generate_moves
    #     row = generate_left_row(current_pos) + generate_right_row(current_pos)
    #     col = generate_top_column(current_pos) + generate_bottom_column(current_pos)
    #     (row + col).sort
    # end
end
