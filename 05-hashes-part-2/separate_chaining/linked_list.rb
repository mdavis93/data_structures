require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
    self.head = nil
    self.tail = nil
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(data)
    node = data.is_a?(Node) ? data : Node.new(data[:key], data[:value])
    current_node = head
    current_node = current_node.next while current_node.next
    current_node.next = node
    self.tail = node
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    each do |e|
      next unless e.next == tail
      self.head = nil if e == head
      e.next = nil
    end
  end

  # This method prints out a representation of the list.
  def print
    child_node = "\u21AA".encode('utf-8')
    current_node = head
    unless current_node.nil?
      puts "'#{current_node.key}', '#{current_node.value}'"
      while current_node
        current_node = current_node.next
        puts " #{child_node}'#{current_node.key}', '#{current_node.value}'" unless current_node.nil?
      end
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    current_node = head
    if current_node == node
      self.head = current_node.next ? current_node.next : nil
    else
      while current_node.next
        current_node.next = current_node.next.next if current_node.next.key == node.key && current_node.value == node.value
        current_node = current_node.next
      end
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    node = Node.new(node[:key], node[:value]) unless node.is_a?(Node)
    if head
      temp = head
      self.head = node
      head.next = temp
    else
      self.head = node
    end

  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
  end
end