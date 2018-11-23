class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[0]
  end

  def enqueue(element)
    @queue[size] = element
    update_queue
    @queue
  end

  def dequeue
    temp = @head
    @queue = @queue.reject { |q| q == @head }
    update_queue
    temp
  end

  def size
    @queue.length
  end

  def empty?
    @queue.empty?
  end

  private

  def update_queue
    @tail = @queue[size - 1]
    @head = @queue[0]
  end
end