DIAGONALS_NEIGHBORS_CALC = [
    [-1, -1],
    [-1, 1],
    [1, -1],
    [1, 1]
].freeze

class Node
    attr_accessor :value, :position
    def initialize( value = ".", position)
        @value = value
        @position = position
    end 
end