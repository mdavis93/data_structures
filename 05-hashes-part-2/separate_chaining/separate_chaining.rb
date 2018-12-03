require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size) { LinkedList.new }
  end

  def []=(key, value)
    index = index(key, @items.length)
    if @items[index].head.nil?
      @items[index].add_to_front(key: key, value: value)
    else
      @items[index].add_to_tail(key: key, value: value)
    end
    resize if load_factor > @max_load_factor
  end

  def [](key)
    list = @items[index(key, size)]
    current_head = list.head
    while current_head
      return current_head.value if current_head.key == key
      current_head = current_head.next
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    return key if key.is_a?(Integer)
    count = 0
    key.each_char { |c| count += c.ord }
    count % size
  end

  # Calculate the current load factor
  def load_factor
    total_elements = 0
    each(true) do |e|
      total_elements += 1 unless e.nil?
    end
    total_elements.to_f / size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  def count_elements
    count = 0
    each(true) do |e|
      count += 1 unless e.nil?
    end
    count
  end

  # Resize the hash
  def resize
    temp = @items
    @items = Array.new(size * 2) { LinkedList.new }
    temp.each do |list|
      next unless list.head
      current_node = list.head
      while current_node
        self[current_node.key] = current_node.value
        current_node = current_node.next
      end
    end
    @items
  rescue StandardError => e
    puts e.message
    puts e.backtrace.inspect
  end

  def print
    puts "\n\nSeparate Chaining
    Base Size: #{@items.length}
    Load Factor: #{load_factor}
         "
    @items.each(&:print)
  end

  def each(all = false, &_)
    @items.each do |i|
      current_node = i.head
      yield current_node
      # next if current_node.nil? || !all
      next unless all
      while current_node
        current_node = current_node.next
        yield current_node, true
      end
    end
  end
end
