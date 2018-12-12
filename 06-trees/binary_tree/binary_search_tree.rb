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
  def find(root, node)
    return nil if node.nil?
    res = nil
    temp = root
    if temp.rating < node.rating
      find(temp.left, node)
    elsif temp.rating > node.rating
      find(temp.right, node)
    else
      res = temp
    end
    res
  end

  def delete(root, node)
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    temp = root
    unless temp.nil?
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
