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
    attr_accessor :symbol, :x_pos, :y_pos, :initial_pos
    def initialize(x_pos = 4, y_pos = 4)
        @symbol = "\u265E"
        @x_pos = x_pos
        @y_pos = y_pos
        @initial_pos = [x_pos, y_pos]
    end

    #get_moves([0,2])
    def get_moves(pos=[x_pos, y_pos])
        moves = {}
        count = 1
        MOVE_SET.each_with_index do |move, move_index|
            if (move[0] + pos[0]).between?(0,8) && (move[1] + pos[1]).between?(0,8)
                    moves[count] = [move[0] + pos[0], move[1] + pos[1]]
                    count += 1
            end            
        end
        moves
        
    end

    def move_to(x,y)
        @x_pos = x 
        @y_pos = y    
        @initial_pos = [x,y]   
    end
end

knight = Knight.new(4,4)
p knight.initial_pos
knight.move_to(5,4)
p knight.initial_pos

