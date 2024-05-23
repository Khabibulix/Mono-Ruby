class Node
    attr_accessor :data, :left, :right
    def initialize(data)
        @data = data
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
        return nil if !@array.is_a? Array
        middle = @array.length / 2
        @root = Node.new(@array[middle])
        @root
    end
end

t = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
p t.build_tree