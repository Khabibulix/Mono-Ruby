class Node 
    attr_accessor :value, :parent
    def initialize(value=nil, parent=nil)
        @value = value
        @parent = parent
    end

    def get_path(node, path_array=[node.value])
        path_array.push(@parent)
        return path_array if @parent.class == Array

        get_path(@parent, path_array)
        
    end

end