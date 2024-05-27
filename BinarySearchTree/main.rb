class Node
    attr_accessor :data, :left, :right
    def initialize(data, left, right)
        @data = data
        @left = left
        @right = right
    end
end

class Tree
    attr_accessor :array
    def initialize(array)
        @array = array.sort.uniq!
    end

    def build_tree(arr=@array) 
        return nil if arr.empty?
        mid = arr.length / 2
        Node.new(arr[mid], build_tree(arr[0...mid]), build_tree(arr[mid + 1..]))
    end

    
end

t = Tree.new([1, 3, 4, 4, 5, 7, 7, 8, 9, 9, 23, 67, 324, 6345])
p t.build_tree

