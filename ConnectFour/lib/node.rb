DIAGONALS_NEIGHBORS_CALC = [
    [-1, -1],
    [-1, 1],
    [1, -1],
    [1, 1]
].freeze

class Node
    attr_accessor :value, :position, :neighbors
    def initialize( value = ".", position)
        @value = value
        @position = position
        @neighbors = get_neighbors
    end 

    def get_neighbors
        neighbors = []
        DIAGONALS_NEIGHBORS_CALC.each do |pos|
            if (position[0] + pos[0]).between?(0,8) && (position[1] + pos[1]).between?(0,8)
                neighbors.push([position[0] + pos[0], position[1] + pos[1]])
            end
        end
        neighbors
    end


end