class Node 
    attr_accessor :position, :childs, :parent
    def initialize(position, childs, parent)
        @position = position
        @childs = childs
        @parent = parent
end