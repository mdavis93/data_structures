1. **What is Spatial Locality and why does it benefit performance?**
    * Wikipedia defines _Spacial Locality_ as:
     >Spatial locality refers to the use of data elements within relatively close storage locations. Sequential locality, a special case of spatial locality, occurs when data elements are arranged and accessed linearly, such as, traversing the elements in a one-dimensional array.
    * This would be win segments of data are stored _relatively close_ to one another in RAM. An example would be the `Array` structure, which stores the contained data sequentially in memory.  Conversely, the `LinkedList` construct does not, and therefor has no _Spacial Locality_.
2. **Compare the performance of an Array to a Linked List using the Benchmark module.**
    * Compare the time it takes to create a 10,000 item Array to appending 10,000 items to a Linked List.

        **CODE**
        ```ruby
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
        ```
 
        **RESULT**
        
        | |user | system | total | real |
        |---|--:|--:|--:|--:
        Array: | 0.000000 | 0.000000 | 0.000000 | (  0.000056)
        Linked: | 0.940000 | 0.000000 | 0.940000 | (  0.939187)
      
    * Compare the time it takes to access the 5000th element of the Array and the 5000th Node in the Linked List.
    
        **CODE**
        ```ruby
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
        ```
        
        **RESULT**
    
        | | user | system | total | real
        |---|--:|--:|--:|--:|
        Array: | 0.000000 | 0.000000 | 0.000000 | (  0.000003)
        Linked: | 0.000000 | 0.000000 | 0.000000 | (  0.000340)
        
    * Compare the time it takes to remove the 5000th element from the Array to removing the 5000th Node in the Linked List.

        **CODE**
        
        **RESULT**
        
        | | user | system | total | real
        ---|--:|--:|--:|--:
        Array: | 0.000000 | 0.000000 | 0.000000 | (  0.000008)
        Linked: | 0.000000 | 0.000000 | 0.000000 | (  0.000455)
        
        * In the Array, the 5001st item becomes the 5000th, and so on.