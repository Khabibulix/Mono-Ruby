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

    #Necessary for delete_node
    def get_min_value(root)
        min_value = root.data
        while root.left
            min_value = root.left.data
            root = root.left
        end
        min_value
    end

    def delete_node(root=@root, value)
        return root if root.nil?

        if value < root.data
            root.left = delete_node(root.left, value)
        elsif value > root.data
            root.right = delete_node(root.right, value)
        else
            return root.right if root.left.nil?
            return root.left if root.right.nil?
            root.data = get_min_value(root.right)
            root.right = delete_node(root.right, root.data)
        end
        root
    end

    def find(root=@root, value)
        return nil if root.nil?
        return root if value == root.data
            
        if value < root.data
            find(root.left, value)
        else
            find(root.right, value)
        end
    end

    
    

    
end