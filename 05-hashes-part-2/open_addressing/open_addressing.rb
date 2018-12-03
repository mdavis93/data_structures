require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    value = Node.new(key, value) unless value.is_a?(Node)
    i = next_open_index(index(key, size))
    while i == -1
      resize
      i = next_open_index(index(key, size))
    end
    @items[i] = value
  end

  def [](key)
    key = key.is_a?(Node) ? key.key : key
    index = index(key, size)

    while @items[index].nil? || @items[index].key != key
      raise KeyError, "KeyError: Key Not Found - '#{key}'" if index > size - 1
      index += 1
    end

    @items[index].value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    count = 0
    key.each_char { |c| count += c.ord }
    count % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    return index if @items[index].nil?
    until @items[index].nil?
      return -1 if index + 1 > size - 1
      index += 1
    end

    index
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

  def print
    puts "\n\n-----CONTENTS-----"
    puts "--Element Count: #{size}"
    puts "--Load Factor: #{load_factor}"
    puts '--'
    @items.each_with_index do |i, x|
      puts "-- #{x} => nil" if i.nil?
      puts "-- #{x} => #{i.key}: #{i.value}" unless i.nil?
    end
    puts "----------END----------\n"
  end

  # Resize the hash
  def resize
    temp = @items
    @items = Array.new(size * 2)
    temp.each do |item|
      next if item.nil?
      i = next_open_index(index(item.key, size))
      while i == -1
        resize
        i = next_open_index(index(item.key, size))
      end
      @items[i] = item
    end
  end

  def load_factor
    total_elements = 0
    @items.each do |e|
      total_elements += 1 unless e.nil?
    end
    total_elements.to_f / size
  end
end