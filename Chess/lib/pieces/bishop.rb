require_relative 'piece'


class Bishop < Piece
    attr_reader :number, :possible_pos, :symbol
    def initialize(color, number, initial_pos = [])
        super
        @color = color
        @symbol = (color == "white" ? "\u2657" : "\u265D").encode
        @possible_pos = {
            "white" => [[7,2],[7,5]],
            "black" => [[0,2], [0,5]]
        }
        @initial_pos = initial_pos.empty? ? (color == "white" ? @possible_pos["white"][number - 1] : @possible_pos["black"][number - 1]) : initial_pos
        @current_pos = initial_pos if @current_pos.empty?
        @moves = generate_moves
    end

    def inside?(pos)
        super
    end

    def valid?(current, next_pos)
        super
    end

    def move(next_pos)
        super
    end

    def to_s
        super    
    end

    def generate_moves     
        potential_pos = current_pos
        p potential_pos
        initial_row = potential_pos[0]
        initial_col = potential_pos[1]
        p initial_pos.nil?
        if initial_col.nil?
            p potential_pos
        end        


        if initial_col != 0
            #Left top
            8.times do
                if inside?([potential_pos[0] - 1, potential_pos[1] - 1])
                    moves << [potential_pos[0] - 1, potential_pos[1] - 1] 
                else
                    break                
                end
                potential_pos = [potential_pos[0] - 1, potential_pos[1] - 1]
            end

            potential_pos = current_pos
            initial_row = potential_pos[0]
            initial_col = potential_pos[1]

            #Left bottom diagonal
            8.times do
                if inside?([potential_pos[0] + 1, potential_pos[1] - 1])
                        moves << [potential_pos[0] + 1, potential_pos[1] - 1] 
                else
                    break
                end
                potential_pos = [potential_pos[0] + 1, potential_pos[1] - 1]
            end        
        end

        if initial_col != 7

            potential_pos = current_pos
            initial_row = potential_pos[0]
            initial_col = potential_pos[1]

            #Right top
            8.times do
                if inside?([potential_pos[0] - 1, potential_pos[1] + 1])
                    moves << [potential_pos[0] - 1, potential_pos[1] + 1] 
                else
                    break
                end
                potential_pos = [potential_pos[0] - 1, potential_pos[1] + 1]
            end

            potential_pos = current_pos
            initial_row = potential_pos[0]
            initial_col = potential_pos[1]

            #Right bottom diagonal
            8.times do
                if inside?([potential_pos[0] + 1, potential_pos[1] + 1])
                    moves << [potential_pos[0] + 1, potential_pos[1] + 1] 
                else
                    break
                end
                potential_pos = [potential_pos[0] + 1, potential_pos[1] + 1]
            end
        end

        moves
    end
end


# bishop_at_first_col = Bishop.new("white", 1, [4,3])
# p bishop_at_first_col.moves