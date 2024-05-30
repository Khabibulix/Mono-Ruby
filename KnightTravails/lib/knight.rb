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

    #move_valid?([0,1], [0,2])
    def move_valid?(initial_pos, next_pos)
        
        MOVE_SET.each do |move|
            x_pos_valid = initial_pos[0] + move[0] == next_pos[0] && next_pos[0].between?(0,8)
            y_pos_valid = initial_pos[1] + move[1] == next_pos[1] && next_pos[1].between?(0,8)
            if x_pos_valid && y_pos_valid
                return true
            end
        end
        false
    end

    def get_moves
        p "Nothing here for now"
    end
end

knight = Knight.new(4,4)
p knight.move_valid?([4,4],[5,2])
