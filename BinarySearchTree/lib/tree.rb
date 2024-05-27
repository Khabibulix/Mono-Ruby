
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