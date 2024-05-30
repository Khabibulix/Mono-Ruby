MOVE_SET = [
    [-2, -1],
    [-1, -2],
    [1, -2],
    [-2, 1],
    [-1, 2],
    [1, 2],
    [2, -1],
    [2, 1]
].freeze

class Knight
    attr_accessor :symbol, :x_pos, :y_pos
    def initialize(x_pos = 4, y_pos = 4)
        @symbol = "\u265E"
        @x_pos = x_pos
        @y_pos = y_pos
    end

    def get_moves(pos=[x_pos, y_pos])
        moves = {}
        MOVE_SET.each_with_index do |move, move_index|
            if (move[0] + pos[0]).between?(0,8) && (move[1] + pos[1]).between?(0,8)
                    moves[move_index] = [move[0] + pos[0], move[1] + pos[1]]
            end            
        end
        moves
        
    end

    def move
        p "Idem"
    end
end

knight = Knight.new(4,4)
p knight.get_moves([0,8])
