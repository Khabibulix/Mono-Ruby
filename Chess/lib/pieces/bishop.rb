require_relative 'piece'


class Bishop < Piece
    attr_reader :number, :possible_pos, :symbol
    def initialize(color, number = 1, initial_pos = [])
        super
        @color = color
        @symbol = (color == "white" ? "\u2657" : "\u265D").encode
        @possible_pos = {
            "white" => [[0,2], [0,5]], 
            "black" => [[7,2],[7,5]]
        }
        @initial_pos = initial_pos.empty? ? (color == "white" ? @possible_pos["white"][number - 1] : @possible_pos["black"][number - 1]) : initial_pos
        @current_pos = @initial_pos
        @moves = generate_moves
    end

    def inside?(pos)
        super
    end

    def valid?(current = @current_pos, next_pos)
       generate_moves.include?(next_pos) ? true : false
    end

    def move(next_pos)
        super
    end

    def to_s
        super    
    end

    def generate_top_left_diagonal(pos = current_pos, board = @board)
		result = []
        8.times do
            pos = [pos[0] - 1, pos[1] - 1]
            inside?(pos) ? result << pos : break                       
        end
		result.sort
    end

    def generate_top_right_diagonal(pos = current_pos, board = @board)
        result = []
        8.times do
            pos = [pos[0] - 1, pos[1] + 1]
            inside?(pos) ? result << pos : break
        end
        result.sort
    end

    def generate_left_bottom_diagonal(pos = current_pos, board = @board)
        result = []
        8.times do
            pos = [pos[0] + 1, pos[1] - 1]
            inside?(pos) ? result << pos : break
        end
        result
    end

    def generate_right_bottom_diagonal(pos = current_pos, board = @board)
        result = []
        8.times do
            pos = [pos[0] + 1, pos[1] + 1]
            inside?(pos) ? result << pos : break
        end
        result
    end
    
    def generate_moves    
        left_diagonal = generate_top_left_diagonal(current_pos) + generate_left_bottom_diagonal(current_pos)              
        right_diagonal = generate_top_right_diagonal(current_pos) + generate_right_bottom_diagonal(current_pos)
        (left_diagonal + right_diagonal).sort
    end
end

b = Bishop.new("white", 1, [4,2])
p b.generate_moves