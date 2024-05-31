require_relative 'node'

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
    attr_accessor :symbol, :initial_pos
    def initialize(x_pos = 4, y_pos = 4)
        @symbol = "\u265E"
        @initial_pos = [x_pos, y_pos]
    end

    #get_moves([0,2])
    def get_moves(pos=initial_pos)
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

    def knight_moves(
        current_pos,
        result_pos,
        shortest_path = 100,
        possibles_paths = [],
        iteration = 1,
        nodes_to_check = [])       
        
        moves = get_moves(current_pos)

        # p current_pos

        if iteration == 2
            return "Finish"
        else
            moves.each do |move|
                nodes_to_check.unshift(Node.new(move[1], current_pos)).uniq!
            end 

            p nodes_to_check


            if moves.value?(result_pos)
                moves.each do |cell|
                    if cell[1] == result_pos
                        shortest_path = iteration if iteration < shortest_path
                        possibles_paths.push([current_pos, cell[1]])
                        p "test"
                        return possibles_paths
                    end
                end
            else    
                knight_moves(result_pos, nodes_to_check.pop.childs, shortest_path, possibles_paths, iteration + 1, nodes_to_check)
            end
        end


        return "Empty queue" if nodes_to_check.empty?
        return [current_pos, result_pos] if moves.value?(result_pos) && iteration == 1

        p "Is current pos: #{current_pos}"
        p "Is nodes_to_check: #{nodes_to_check}"
        
        # possibles_paths.uniq   
        nodes_to_check
        
    end    

end

knight = Knight.new
p knight.knight_moves([4,4], [8,3])
p knight.knight_moves([4,4], [8,3]).pop

