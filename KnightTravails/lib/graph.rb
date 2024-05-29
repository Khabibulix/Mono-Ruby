# Create a graph of nodes
class Graph
    attr_accessor :matrix
    def initialize(width=10)
        @width = width
        @matrix = Array.new(width) {Array.new(width, 0)}
    end
    
    def print_matrix
        @matrix.each do |row| 
            p row.join(" | ")
            # p " _  " * @width
        end
    end

    def add_edge(node1, node2)
        @matrix[node1][node2] = 1
        @matrix[node2][node1] = 1
    end

    def has_edge?(node1, node2)
        @matrix[node1][node2] == 1
    end
end
