require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    self.width = width
    self.height = height
    self.matrix = Array.new(width) { Array.new(height) }
  end

  # Insert a pixel at the x, y coordinates
  def insert(pixel, x, y)
    matrix[x][y] = pixel
  end

  # Returns the pixel at a specific location
  def at(x, y)
    matrix[x][y] if inbounds(x, y)
  end

  private

  def inbounds(x, y)
    if x < 0 || x > width || y < 0 || y > height
      false
    else
      true
    end
  end

end