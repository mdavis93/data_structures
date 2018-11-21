require_relative 'node'
require 'benchmark'

class LinkedList
  include Benchmark
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`,
  # and inserts it at the end of the list.
  # Returns the resulting LinkedList
  def add_to_tail(node)
    if head
      curr = head
      curr = curr.next while curr.next
      curr.next = node
    else
      self.head = node
    end
    self.tail = node

    self
  end

  # This method removes the last node in the lists
  # and must keep the rest of the list intact.
  # Returns the removed element
  def remove_tail
    if head == tail
      self.head = nil
      self.tail = nil
    else
      curr = head
      curr = curr.next while curr.next != tail
      curr.next = nil
      self.tail = curr
    end
  end

  # This method prints out a representation of the list.
  def print
    curr = head

    while curr
      puts curr.data
      curr = curr.next
    end
  end

  # This method removes `node` from the list and
  # must keep the rest of the list intact.
  def delete(node)
    # Check if 'head' is equal to the 'node' being removed
    if head == node
      self.head = head.next
    else
      curr = head
      curr = curr.next while curr.next != node

      if curr.next == tail
        curr.next = nil
        self.tail = curr
      else
        curr.next = curr.next.next.nil? ? nil : curr.next.next
      end
    end
  end

  # This method adds `node` to the front of the list
  # and must set the list's head to `node`.
  def add_to_front(node)
    node.next = head
    self.head = node
  end

  # This method removes and returns the first node in the
  # Linked List and must set Linked List's head to the second node.
  def remove_front
    self.head = head.next
  end

  def benchmark_it
    puts 'Creating 10,000 Elements'
    Benchmark.bm(7) do |x|
      x.report('Array:') { Array.new(10000, 'Test') }
      x.report('Linked:') do
        link = LinkedList.new
        10000.times do |x|
          n1 = Node.new('Test')
          link.add_to_tail(n1)
        end
      end
    end

    puts 'Retrieving 5,000th element'
    Benchmark.bm(7) do |x|
      arr = Array.new(10000, 'Test')
      list = LinkedList.new
      10000.times do |x|
        n1 = Node.new('Test')
        list.add_to_tail(n1)
      end

      curr = list.head

      x.report('Array:') { arr[5000] }
      x.report('Linked:') do
        5000.times do
          curr = curr.next
        end
      end
    end

    puts 'Remove the 5,000th element'

    Benchmark.bm(7) do |x|
      arr = Array.new(10000, 'Test')
      list = LinkedList.new
      10000.times do |x|
        n1 = Node.new('Test')
        list.add_to_tail(n1)
      end

      curr = list.head

      x.report('Array:') { arr.slice!(5000) }
      x.report('Linked:') do
        5000.times do
          curr = curr.next
        end
        list.delete(curr)
      end
    end
  end
end
