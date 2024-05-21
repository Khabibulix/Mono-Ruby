require "#{Dir.pwd}/node.rb"


class LinkedList

    def initialize
        @head = nil
    end


    def is_empty?
        @head == nil
    end
end


ll = LinkedList.new()
p ll.is_empty?