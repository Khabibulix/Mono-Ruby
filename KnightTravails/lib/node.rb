class Node 
    attr_accessor :childs, :parent
    def initialize(childs, parent)
        @childs = childs
        @parent = parent
    end
end