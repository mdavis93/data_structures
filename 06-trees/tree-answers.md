1. **Print both Trees to the console and compare the difference between your Binary Search Tree and your Heap.**
   - Binary Search Tree:
     - Adaptation: 91
     - Legends of the Fall: 56
     - Gone With The Wind: 92
     - The Fifth Element: 72
     - Schindler's List: 97
     - Love Actually: 63
     - V for Vendetta: 73
     - The Apartment: 93
     - Leon: 71
     - Mother: 90
     - Pride and Prejudice: 85
     - Dirty Rotten Scoundrels: 88
     - Black Swan: 86

   - Min Binary Heap:
       - Legends of the Fall: 56
       - Love Actually: 63
       - V for Vendetta: 73
     - Adaptation: 91
     - Leon: 71
     - Gone with the Wind: 92
     - Black Swan: 86
     - Pride and Prejudice: 85
     - The Apartment: 93
     - Dirty Rotten Scoundrels: 88
     - Adaptation: 91

2. **Insert all numbers from 1 to 100000 into both Trees, then use Benchmark to compare performance:**

    - |  | user  |  system | total | real |
      |---|---|---|---|---|
      insert numbers 1 to 10000 into tree: | 16.950000 | 0.020000 | 16.970000 | ( 16.975384)
      insert numbers 1 to 10000 into heap: | 0.030000 | 0.000000 | 0.030000 | (  0.030190)
      find 5000th element in tree:         | 0.000000 | 0.000000 | 0.000000 | (  0.001075)
      find 5000th element in heap:         | 0.000000 | 0.000000 | 0.000000 | (  0.000010)
      remove 5000th element in tree:       | 0.000000 | 0.000000 | 0.000000 | (  0.001063)
      remove 5000th element in heap:       | 0.000000 | 0.000000 | 0.000000 | (  0.000009)

    - **How much time does an average insertion consume in the Binary Search Tree compared to the Heap?**
        - Comparing the average insertion time for Binary Search Tree versus Min Binary Heap shows that Min Binary Heap is more efficient.
    
    - **How much time does finding 50000 in the Binary Search Tree consume compared to the Heap?**
        - Comparing the time required to find the 5000th element shows that Min Binary Heap is more efficient as well.
    
    - **How much time does the average deletion consume in a Binary Search Tree compared to the Heap?**
        - Comparing the average deletion time shows that Min Binary Heap is yet again more efficient.
    
    - **When would you use a Binary Search Tree and why?**
        - I would use Binary Search Tree for elements that I need to store and search quickly. The elements are inserted based on the element's rating compared to the root, so one side of the tree can become more populated than the other side of the tree.
    
    - **When would you use an Heap and why?**
        - I would use Min Binary Heap for prioritizing elements because heaps keep information organized and fills in nodes from left to right on each level of the tree before moving to the next level. This keeps the elements more organized and more efficient in searching/deleting.
