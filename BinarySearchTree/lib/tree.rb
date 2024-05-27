require_relative 'node.rb'

class Tree
    attr_accessor :data, :root
    def initialize(array)
        @data = array.sort.uniq!
        @root = build_tree(data)
    end

    def pretty_print(node = root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end

    def build_tree(array) 
        return nil if array.empty?
    
        middle = array.length / 2
        root_node = Node.new(array[middle])
    
        root_node.left = build_tree(array[0...middle])
        root_node.right = build_tree(array[(middle + 1)..-1])
    
        root_node 
    end

    def insert_node(root=@root, value)
        if root.nil?
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
        return root
    end

    
end