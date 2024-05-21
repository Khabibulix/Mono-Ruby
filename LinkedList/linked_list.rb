require "#{Dir.pwd}/node.rb"


class LinkedList

    def initialize(head)
        @head = head
    end

    def head
        @head
    end

    def prepend(value)
        current_node = Node.new(value)   
        current_node.next_node = @head
        @head = current_node
    end

    def tail
        current_node = @head
        while current_node.next_node
            current_node = current_node.next_node
        end
        current_node
    end

end


node = Node.new("C")
ll = LinkedList.new(node)
ll.prepend("B")
p ll.head.to_s #Should be "B"
p ll.tail.to_s #Should be "C"


