class Node
  attr_accessor :data, :next,:key

  def initialize(data,key)
   @data = data
    @key = key
   @next = nil
  end
end

class HashMap
  
  def initialize
    @buckets= Array.new(16)   
    @size = 0
 end
  
  def hash(string) 
    hashCode = 0
    primeNumber = 31
    string.each_char{|char| hashCode = primeNumber * hashCode + char.ord}
    hashCode
  end

  def set(key,value)
    index = hash(key)%@buckets.length
    newNode = Node.new(value,key)
    if @buckets[index]
       temp = @buckets[index]
       while temp.next
        temp = temp.next
       end
      temp.next = newNode
    else
     @buckets[index] = newNode
    end
    @size += 1
  end

  def get(key)
    @buckets[hash(key)%@buckets.length]
  end

  def key?(key)
    @buckets[hash(key)%@buckets.length] == !nil 
  end
  def remove(key)
    @buckets[hash(key)%@buckets.length] = nil
  end
  def length
    @size
  end

  def clear
    @buckets = Array.new(@buckets.size)
    @size = 0
  end
  
  def keys
    result = Array.new
    @buckets.each do |bucket|
      temp =bucket
      while temp
        result << temp.key
        temp = temp.next
      end
    end
    result
  end
   
  def values
    result = Array.new
    @buckets.each do|key|
      temp = key
      while temp
         result << temp.data
         temp = temp.next
      end
    end
    result
  end

  def entries
    result = Array.new
    @buckets.each do |key|
      temp = key
      while temp
        subArray = Array.new
        subArray[0] = temp.key
        subArray[1] = temp.data
        result << subArray
      temp = temp.next
      end
    end
    result 
  end 
end

hasher = HashMap.new
p hasher.hash("Shaswat")

hasher.set("Harry",18)
hasher.set("KingPin",48)
hasher.set("Shaswat",20)
hasher.set("Nvim",10)
hasher.set("Linux",22)
hasher.set("Laptop",3)
hasher.set("Python",5)

p hasher.key?("Nvim")
p hasher.key?("Vim")
p " "

p hasher.keys
p hasher.values
p hasher.entries
