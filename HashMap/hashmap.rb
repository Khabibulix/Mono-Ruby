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
      @size = size
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

      def length
        count = 0
        @buckets.each do |bucket|
          current_node = bucket.head
          if current_node != nil
            count += 1
          end
        end
        count
      end

      def clear
        @buckets = Array.new(@size) {LinkedList.new}
      end

      def keys
        keys = []
        
        @size.times do |index|
          next if @buckets[index].head.nil?
          current_node = @buckets[index].head
          until current_node.nil?
            keys.push(current_node.key)
            current_node = current_node.next 
          end
        end
        keys
      end
      
      def values
        values = []
        
        @size.times do |index|
          next if @buckets[index].head.nil?
          current_node = @buckets[index].head
          until current_node.nil?
            values.push(current_node.value)
            current_node = current_node.next 
          end
        end
        values
      end

      def entries
        entries = []
        
        @size.times do |index|
          next if @buckets[index].head.nil?
          current_node = @buckets[index].head
          until current_node.nil?
            entries.push([current_node.key, current_node.value])
            current_node = current_node.next 
          end
        end
        entries
      end

end

h = HashMap.new()
h.set("Carlos", 25)
h.set("Clara", 12)
p h.get("Carlos") #Expected 25
p h.has?("Carlos") #Expected true
p h.remove("Claros") #Expected nil
p h.remove("Carlos") #Expected true
p h.get("Carlos") #Expected nil
p h.length #Expected 1
p h.keys #Expected ["Clara"]
p h.values #Expected [12]
p h.entries #Expected [["Clara", 12]]
