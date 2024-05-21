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

    def append(value)
        current_node = Node.new(value)
        tail.next_node = current_node
        current_node.next_node = nil
    end

end


node = Node.new("B")
ll = LinkedList.new(node)
ll.prepend("A")
p ll.head.to_s #Should be "A"
p ll.tail.to_s #Should be "B"
ll.append("C")
p ll.tail.to_s #Should be "C"


