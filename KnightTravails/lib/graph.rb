class Graph
    def initialize(width)
        @width = width
        @matrix = Array.new(width) {Array.new(width, 0)}
    end
    
    def print_matrix
        @matrix.each {|row| print "#{row}\n"}
    end

    def add_edge(node1, node2)
        @matrix[node1][node2] = 1
        @matrix[node2][node1] = 1
    end

    def has_edge?(node1, node2)
        @matrix[node1][node2] == 1
    end

end

g = Graph.new(5)
g.add_edge(0,2)
g.print_matrix
p g.has_edge?(0,2)