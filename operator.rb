# what difference between single quote vs doublequite?
require_relative 'expression'

class Operator < Expression

  def initialize(lhs, type, rhs)
    @type = type
    @lhs = lhs
    @rhs = rhs
  end

  def evaluate
    case @type
      when :+
        return @lhs.evaluate + @rhs.evaluate

      when :-
        return @lhs.evaluate - @rhs.evaluate

      when :*
        return @lhs.evaluate * @rhs.evaluate

      when :/
        return @lhs.evaluate / @rhs.evaluate

      else
        raise ArgumentError.new "Unsupported operator: #{@type}. Use +, -, *, / instead."
    end
  end

  def to_s
    "(#{@lhs} #{@type.to_s} #{@rhs})"
  end

end