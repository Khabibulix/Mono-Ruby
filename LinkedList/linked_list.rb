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

    def size
        current_node = @head
        size = 1
        while current_node.next_node
            current_node = current_node.next_node
            size += 1
        end
        size
    end

    def at(index)
        current_node = @head
        current_index = 1
        while current_node.next_node
            if index == current_index
                return current_node
            end
            current_node = current_node.next_node
            current_index += 1
        end
    end

end


node = Node.new("B")
ll = LinkedList.new(node)
ll.prepend("A")
p ll.head.to_s #Should be "A"
p ll.tail.to_s #Should be "B"
ll.append("C")
p ll.tail.to_s #Should be "C"
p ll.size #Should be 3
ll.append("D")
ll.append("E")
p ll.size #Should be 5
p ll.at(3).to_s


