class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack[@stack.length] = item
    self.top = item
  end

  def pop
    temp = @stack[@stack.length - 1]
    @stack.delete_at(@stack.length - 1)
    self.top = @stack[@stack.length - 1]
    temp
  end

  def empty?

    # This can also be accomplished by checking if @stack.length == 0
    @stack.empty?
  end
end