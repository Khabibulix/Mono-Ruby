class Graph
    def initialize(width)
        @width = width
        @matrix = Array.new(width) {Array.new(width, 0)}
    end

    def print_matrix
        @matrix.each {|row| print "#{row}\n"}
    end
end

g = Graph.new(5)
g.print_matrix