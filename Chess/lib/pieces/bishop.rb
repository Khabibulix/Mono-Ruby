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
       inside?(next_pos) && moves.include?(next_pos) ? true : false
    end

    def move(next_pos)
        super
    end

    def to_s
        super    
    end

    def generate_top_left_diagonal(pos)
        8.times do
            pos = [pos[0] - 1, pos[1] - 1]
            inside?(pos) ? moves << pos : break                       
        end
    end

    def generate_top_right_diagonal(pos)
        8.times do
            pos = [pos[0] - 1, pos[1] + 1]
            inside?(pos) ? moves << pos : break
        end
    end

    def generate_left_bottom_diagonal(pos)
        8.times do
            pos = [pos[0] + 1, pos[1] - 1]
            inside?(pos) ? moves << pos : break
        end
    end

    def generate_right_bottom_diagonal(pos)
        8.times do
            pos = [pos[0] + 1, pos[1] + 1]
            inside?(pos) ? moves << pos : break
        end
    end
    
    def generate_moves     
        pos = initial_pos


        if pos[1] != 0
            #Left top
            if pos[0] != 0                
                generate_top_left_diagonal(pos)                
            end

            pos = initial_pos

            if pos[0] != 7
                #Left bottom diagonal
                generate_left_bottom_diagonal(pos)    
            end   
        end

        if pos[1] != 7
            if pos[0] != 0
                #Right top
                generate_top_right_diagonal(pos)                
            end

            pos = initial_pos

            if pos[0] != 7
                #Right bottom diagonal
                generate_right_bottom_diagonal(pos)
            end
        end

        moves.delete_at(moves.find_index(initial_pos)) if moves.include?(initial_pos)
        return moves.sort.uniq
    end
end
