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

    def get_bucket(key)
      hash_code = hash(key)
      index = hash_code % @buckets.size
      current_bucket = @buckets[index]
      current_bucket
    end

    def hash(key)
        hash_code = 0
        prime_number = 31
           
        key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
           
        hash_code
    end

      def set(key, value)
        current_bucket = get_bucket(key)
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
        current_bucket = get_bucket(key)        
        current_node = current_bucket.head

        until current_node.nil?
          if current_node.key == key
            return current_node.value
          end
          current_node = current_node.next
        end

        return nil
      end

      def has?(key)
        current_bucket = get_bucket(key)        
        current_node = current_bucket.head

        until current_node.nil?
          return current_node.key == key ? true : false
          current_node = current_node.next
        end
      end

      def remove(key)
        return nil if !has?(key)
        current_bucket = get_bucket(key)
        current_node = current_bucket.head
        prev_node = nil

        until current_node.nil?
          if current_node.key == key 
            if prev_node.nil?
              current_bucket.head = current_node.next
            else
              prev_node.next = current_node.next
            end
            return true
          end
          prev_node = current_node
          current_node = current_node.next
        end
        false
      end
end

h = HashMap.new()
h.set("Carlos", 25)
p h.get("Carlos") #Expected 25
p h.has?("Carlos") #Expected true
p h.remove("Claros") #Expected nil
p h.remove("Carlos") #Expected true
p h.get("Carlos") #Expected nil
p h
