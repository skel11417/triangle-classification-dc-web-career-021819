require 'pry'
class Triangle
  # write code here
  attr_reader :sides

  def initialize(side1, side2, side3)
    # raise an error if any side is less than or equal to zero
    @sides = [side1, side2, side3]
  end

  def no_size_check
    if self.sides.find {|side| side <= 0}
      raise TriangleError
    end
  end

  def size_inequality_check
    t = self.sides
    i = 0
    while i < 3 do
      if t[i-2] + t[i-1] <= t[i]
          raise TriangleError
      end
      i += 1
    end
  end

  def kind
    no_size_check
    size_inequality_check
    case sides.uniq.length
    when 1
      return :equilateral
    when 2
      return :isosceles
    else
      return :scalene
    end
  end

  class TriangleError < StandardError

  end
end
