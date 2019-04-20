require_relative 'node'

class MinBinaryHeap
  attr_reader :root

  def initialize(root)
    @root = root
    @heapsize = 1
  end

  def insert(root, node)
    size = @heapsize + 1
    current_level = Math.log2(size).floor
    level_capacity = 2**current_level
    level_midway = level_capacity / 2
    tree_capacity = 2**(current_level + 1) - 1
    level_position = level_capacity - (tree_capacity - size)

    if root.left.nil?
      root.left = node
      node.parent = root
      @heapsize += 1
    elsif root.right.nil? && !root.left.nil?
      root.right = node
      node.parent = root
      @heapsize += 1
    elsif level_position <= level_midway
      insert(root.left, node)
    elsif level_position > level_midway
      insert(root.right, node)
    end
    swap(root, node) if node.rating < root.rating
  end

  def swap(root, node)
    root_parent = root.parent
    root_left = root.left
    root_right = root.right

    node_left = node.left
    node_right = node.right

    unless root_parent.nil?
      if root_parent.left == root
        root_parent.left = node
      else
        root_parent.right = node
      end
    end

    node.left = if root_left == node
                  root
                else
                  root_left
                end

    node.right = if root_right == node
                   root
                 else
                   root_right
                 end

    node.parent = root_parent

    root.left = node_left
    root.right = node_right
    root.parent = node

    node = root
    root = root.parent

    if root.parent.nil?
      @root = root
    elsif root.parent.rating > root.rating
      swap(root.parent, root)
    end
  end

  def find(root, data)
    return nil if data.nil? || root.nil?
    if root.title == data
      return root
    else
      node = find(root.left, data)
      node = find(root.right, data) if node.nil?
    end
    node
  end

  def delete(root, data)
    to_delete = find(root, data)
    if to_delete.nil?
      return nil
    else
      to_delete.title = nil
      to_delete.rating = nil
    end
  end

  def printf(_children = nil)
    children_array = [@root]
    children_array.each do |child|
      children_array << child.left if child.left
      children_array << child.right if child.right
    end

    children_array.each do |child|
      puts "#{child.title}: #{child.rating}"
    end
  end
end

# adaptation = Node.new("Adaptation", 91)
# legends_of_the_fall = Node.new("Legends of the Fall", 56)
# gone_with_the_wind = Node.new("Gone with the Wind", 92)
# fifth_element = Node.new("Fifth Element", 72)
# schindlers_list = Node.new("Schindler's List", 97)
# v_for_vendetta = Node.new("V for Vendetta", 73)
# apartment = Node.new("The Apartment", 93)
# mother = Node.new("Mother", 90)
# love_actually = Node.new("Love Actually", 63)
# leon = Node.new("Leon", 71)
# pride_and_prejudice = Node.new("Pride and Prejudice", 85)
# dirty_rotten_scoundrels = Node.new("Dirty Rotten Scoundrels", 88)
# black_swan = Node.new("Black Swan", 86)
#
# minBinaryHeap = MinBinaryHeap.new(adaptation)
#
# minBinaryHeap.insert(minBinaryHeap.root, legends_of_the_fall)
# minBinaryHeap.insert(minBinaryHeap.root, gone_with_the_wind)
# minBinaryHeap.insert(minBinaryHeap.root, fifth_element)
# minBinaryHeap.insert(minBinaryHeap.root, schindlers_list)
# minBinaryHeap.insert(minBinaryHeap.root, v_for_vendetta)
# minBinaryHeap.insert(minBinaryHeap.root, apartment)
# minBinaryHeap.insert(minBinaryHeap.root, mother)
# minBinaryHeap.insert(minBinaryHeap.root, love_actually)
# minBinaryHeap.insert(minBinaryHeap.root, leon)
# minBinaryHeap.insert(minBinaryHeap.root, pride_and_prejudice)
# minBinaryHeap.insert(minBinaryHeap.root, dirty_rotten_scoundrels)
# minBinaryHeap.insert(minBinaryHeap.root, black_swan)
#
# minBinaryHeap.printf
