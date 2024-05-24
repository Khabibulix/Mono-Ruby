class Node
    attr_accessor :data, :left, :right
    def initialize(data)
        @data = data
        @left = nil
        @right = nil
    end
end

class Tree
    attr_accessor :root, :array
    def initialize(array)
        @root = Node.new(array[array.length/2])
        @array = array.sort.uniq!
    end

    def build_tree(array=@array, root_node=nil)   
        middle = array.length / 2     
        #First iteration
        if root_node.nil?
            root_node = @root
        end

        left_subtree = array.slice(...middle)
        right_subtree = array.slice(middle + 1...)
        root_node.left = Node.new(left_subtree[left_subtree.length / 2])
        root_node.right = Node.new(right_subtree[right_subtree.length / 2])
        p "Root is #{root_node.data}"
        
        root_node        
    end

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
      end

    
end

t = Tree.new([1, 3, 4, 4, 5, 7, 7, 8, 9, 9, 23, 67, 324, 6345])
t.build_tree
t.pretty_print