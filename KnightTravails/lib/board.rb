require_relative 'graph'

class Board < Graph
    def initialize
        @board = Graph.new
        super
    end
end

b = Board.new
b.add_edge(0,1)
b.print_matrix