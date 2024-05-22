#  raise IndexError if index.negative? || index >= @buckets.length
class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
    @tail = nil
  end
end

class Node
  attr_accessor :key, :value, :next

  def initialize(key, value)
    @key = key
    @value = value
    @next = nil
  end
end



class HashMap
    attr_accessor :buckets
    
    def initialize(size = 16)
      @buckets = Array.new(size) {LinkedList.new}
    end

    def hash(key)
        hash_code = 0
        prime_number = 31
           
        key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
           
        hash_code
      end

      def set(key, value)
        hash_code = hash(key)
        index = hash_code % @buckets.size
        current_bucket = @buckets[index]

        current_node = current_bucket.head

        if current_node.nil?
          current_bucket.head = Node.new(key, value)
        else
          until current_node.nil?
            if current_node.key == key
              current_node.value = value
              return
            end
            current_node = current_node.next
          end
          new_node = Node.new(key, value)
          new_node.next = current_bucket.head
          current_bucket.head = new_node
        end
      end

      def get(key)
        hash = hash(key)
        index = hash % @buckets.size
        current_bucket = @buckets[index]
        
        current_node = current_bucket.head

        until current_node.nil?
          if current_node.key == key
            return current_node.value
          end
          current_node = current_node.next
        end

        return nil
      end
end

h = HashMap.new()
h.set("Carlos", 25)
p h.get("Carlos") #Expected 25