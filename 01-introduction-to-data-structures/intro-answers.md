1. **How does your data structure allow developers to access and manipulate the data?**
    * Each structure has accessible methods for adding values into the structure, and reading values from the structure.
    * The `Pixel` object cannot be modified once it's created as there are no methods that allow for modifying the properties within the `Pixel`.
    * The `Screen` object also does not allow for modification, only insertion.  We could enhance the `Screen` class to allow the `Pixel` objects to change colors by creating a `changePixel` method and passing in the location of the pixel to change, along with a new `Pixel` to replace the existing one with.
2. **If a developer wanted to find a specific element in your data structure, how would you search for it?**
    * If a developer wanted to access a pixel at a given location on the screen, the method `Screen#at` could be used.  Pass in the `x, y` location of the `Pixel` and the pixel at that location will be returned.
    * The following example will return the `Pixel` located at `x:2, y:9` on the screen.
        * ```
          screen = Screen.new(10, 10)
          screen.at( 2, 9)
          ````
3. **What other real-world data can each structure represent?**
    * The `Screen` structure is a 2-Dimensional array, thus can represent things such as a classroom of students in a desk, light-bulbs on a marquis board, etc.
    * The `Pixel` structure is a basic `Class` structure with base properties. This could be modified to fit almost any structure we need.  Some things this could represent are things like a door, or wall, where the `r, g, b` values denote the color, and the `x` and `y` values represent the length and height of the wall.  We would need to add a new variable for `width` though.