
class Vector

  attr_reader :values

  def initialize(values)
    @values = values
  end

  def size
    @values.size
  end

  def to_s
    "[#{@values.join(', ')}]" unless @values.nil?
  end

  def +(other)
    case other
      when Vector
        return Vector.new(@values.map.with_index { |x, i| x + other.values[i] })

      when Numeric
        return Vector.new @values.map { |x| x + other }

      else
        raise ArgumentError.new "Unsupported argument: #{other.class}. Expected to be either a Vector with size of #{size} or #{Numeric.to_s}"
    end
  end

  def -(other)
    case other
      when Vector
        return Vector.new @values.map.with_index { |x, i| x - other.values[i] }

      when Numeric
        return Vector.new @values.map { |x| x - other }

      else
        raise ArgumentError.new "Unsupported argument: #{other.class}. Expected to be either a Vector with size of #{size} or #{Numeric.to_s}"
    end
  end

end