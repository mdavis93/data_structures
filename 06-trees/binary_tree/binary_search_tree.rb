require_relative 'node'

class BinarySearchTree
  attr_accessor :root

  def initialize(root)
    self.root = root
  end

  def insert(root, node)
    temp = root
    if node > temp
      if temp.right.nil?
        temp.right = node
      else
        insert(temp.right, node)
      end
    elsif temp.left.nil?
      temp.left = node
    else
      insert(temp.left, node)
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

  def delete(root, title)
    node = find(root, title)
    to_delete = remove_node(root, node)

    return nil if node.nil? || root.nil? || to_delete.nil?

    # Search Tree by rating, for each new node check .left && .right for
    # title being searched for.  Set appropriate branch to nil

    unless to_delete.nil?
      temp_node = to_delete
      while temp_node.left
        temp_node = temp_node.left
        insert(root, temp_node)
      end
      temp_node = to_delete
      while temp_node.right
        temp_node = temp_node.right
        insert(root, temp_node)
      end
    end
  end

  def remove_node(current_node, node)
    while current_node
      if current_node.left == node
        current_node.left = nil
        return node
      elsif current_node.right == node
        current_node.right = nil
        return node
      elsif node.rating < current_node.rating
        current_node = current_node.left
      elsif node.rating > current_node.rating
        current_node = current_node.right
      end
    end
  end

  # Recursive Breadth First Search
  def printf(children = nil)
    queue = children || Queue.new
    queue.enq(root) unless children

    unless queue.empty?
      temp = queue.deq
      queue.enq(temp.left) unless temp.left.nil?
      queue.enq(temp.right) unless temp.right.nil?
      puts "#{temp.title}: #{temp.rating}"
      printf(queue)
    end
  end
end
