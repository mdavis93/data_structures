require_relative 'node'

class BinarySearchTree
  attr_accessor :root

  def initialize(root)
    self.root = root
  end

  def insert(root, node)
    temp = root
    if node.rating > temp.rating
      insert(temp.right, node) unless temp.right.nil?
      temp.right = node if temp.right.nil?
    elsif node.rating < temp.rating
      insert(temp.left, node) unless temp.left.nil?
      temp.left = node if temp.left.nil?
    end
  end

  # Recursive Depth First Search
  def find(root, title)
    return nil if title.nil? || root.nil?
    temp = root

    return temp if temp.title == title
    left = find(temp.left, title)
    right = find(temp.right, title)

    left || right
  end

  def delete(root, node)
  end

  # Recursive Breadth First Search
  def printf(children = nil)
    # Add root to queue
    # *Print node
    # Add node.left to queue
    # Add node.right to queue
    # Dequeue
    # Repeat from *

    queue = children == nil? ? Queue.new : children
    queue.enq(root) unless children

    unless queue.empty?
      puts "#{temp.title}: #{temp.rating}"
      children = Array.new(temp.left, temp.right)
      left = temp.left
      while left
        puts "#{left.title}: #{left.rating}"
        left = left.left
      end
      right = temp.right
      while right
        puts "#{right.title}: #{right.rating}"
        right = right.right
      end
    end
  end
end

