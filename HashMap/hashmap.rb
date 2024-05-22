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
        p current_bucket
      end
end

h = HashMap.new()
h.set("Carlos", "Carl")