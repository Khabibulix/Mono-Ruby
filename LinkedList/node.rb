class Node
    attr_reader :value, :next_node
    def initialize
        @value = nil
        @next_node = nil
    end

    def to_s
        "Node value is: #{@value}"
    end
end
