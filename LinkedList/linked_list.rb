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
        if is_empty?
            @head = current_node
            current_node.next_node = nil
        else
            current_node.next_node = @head
            @head = current_node
        end


    end


    def is_empty?
        @head == nil
    end
end


node = Node.new("Value")
ll = LinkedList.new(node)
ll.prepend("B")
p ll.head.to_s #Should be "B"


