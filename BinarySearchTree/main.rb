class Node
    attr_accessor :data, :left, :right
    def initialize
        @data = nil
        @left = nil
        @right = nil
    end
end

class Tree
    attr_accessor :root
    def initialize(array)
        @root = nil
        @array = array
    end

    def build_tree

    end
end