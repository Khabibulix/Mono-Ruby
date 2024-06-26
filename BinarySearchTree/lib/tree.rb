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

    def level_order
        result_array = []
        visited_nodes = [@root]

        until visited_nodes.empty?
            current_node = visited_nodes.pop
            
            visited_nodes.unshift(current_node.left) if current_node.left
            visited_nodes.unshift(current_node.right) if current_node.right

            result_array.push(current_node.data)
        end

        
        result_array
    end

    def inorder(node=@root, arr = [])
        if node
            inorder(node.left, arr)
            arr.push(node.data)
            inorder(node.right, arr)
        end
        arr
    end

    def preorder(node=@root, arr = [])
        if node
            arr.push(node.data)
            preorder(node.left, arr)
            preorder(node.right, arr)
        end
        arr
    end
    
    def postorder(node=@root, arr = [])
        if node
            postorder(node.left, arr)
            postorder(node.right, arr)
            arr.push(node.data)
            
        end
        arr
    end

    def height(node= @root, count = -1)
        return count if node.nil?
        [height(node.left, count + 1), height(node.right, count + 1)].max
    end

    def depth(node, root = @root, count = 0)
        return count if node.data == root.data

        if node.data < root.data
          depth(node, root.left, count + 1)
        else
          depth(node, root.right, count + 1)
        end
    end

    def balanced?(root = @root)
        return true if root.nil?

        left_height = height(root.left)
        right_height = height(root.right)

        left_balance = balanced?(root.left)
        right_balance = balanced?(root.right)
        balance_rule = (left_height - right_height).abs <= 1

        if left_balance && right_balance && balance_rule
            return true
        end

        false

    end

    def rebalance
        @root = build_tree(inorder)
    end


    

    
end