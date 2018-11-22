class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    new_item = HashItem.new(key, value)
    return if @items[index(key, size)] == new_item
    resize while collision(@items[index(key, size)], new_item)
    i = index(key, size)
    @items[i] = new_item # Recursion check would probably fit here

  end

  def [](key)
    @items[index(key, size)].value
  end

  def resize
    resized_items = Array.new(@items.size * 2)
    @items.each do |item|
      resized_items[index(item.key, resized_items.size)] = item unless item.nil?
    end
    @items = resized_items
  end

  def index(key, size)
    count = 0
    key.each_char { |c| count += c.ord }
    count % size
  end

  def size
    @items.size
  end

  private

  def collision(item, new_item)
    res = false
    unless item.nil?
      res = true if item.value != new_item.value && item.key != new_item.key
    end
    res
  end
end