require_relative 'node.rb'

class Tree
    attr_accessor :array
    def initialize(array)
        @array = array.sort.uniq!
        @root = Node.new(@array[@array.length / 2])
    end

    def build_tree(arr=@array) 
        return nil if arr.empty?
        mid = arr.length / 2
        Node.new(arr[mid], build_tree(arr[0...mid]), build_tree(arr[mid + 1..]))
        arr
    end

    def insert_node(root=@root, value)
        if !root.nil?
            return Node.new(value)
        else
            if root.data == value
                return root
            elsif root.data < value
                root.right = insert_node(root.right, value)
            else
                root.left = insert_node(root.left, value)
            end
        end
        root
    end

    
end