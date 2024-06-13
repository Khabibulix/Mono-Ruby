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
        potential_pos = initial_pos


        if potential_pos[1] != 0
            #Left top
            8.times do
                potential_pos = [potential_pos[0] - 1, potential_pos[1] - 1]
                inside?(potential_pos) ? moves << potential_pos : break                       
            end

            potential_pos = initial_pos

            #Left bottom diagonal
            8.times do
                potential_pos = [potential_pos[0] + 1, potential_pos[1] - 1]
            end        
        end

        if potential_pos[1] != 7

            #Right top
            8.times do
                potential_pos = [potential_pos[0] - 1, potential_pos[1] + 1]
                inside?(potential_pos) ? moves << potential_pos : break
            end

            potential_pos = initial_pos

            #Right bottom diagonal
            8.times do
                potential_pos = [potential_pos[0] + 1, potential_pos[1] + 1]
                inside?(potential_pos) ? moves << potential_pos : break
            end
        end

        moves
    end
end
