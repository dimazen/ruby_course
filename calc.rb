require_relative 'expression'
require_relative 'operator'
require_relative 'const_expression'
require_relative 'types/vector'

class Calc

  def initialize(expression)
    @expression = expression
  end

  def self.from_expression(lhs, operator, rhs)
    self.new Operator.new(ConstExpression.new(lhs), operator, ConstExpression.new(rhs))
  end

  def evaluate
    @expression.evaluate
  end

  def to_s
    @expression.to_s
  end

end


p Operator.new(ConstExpression.new(Vector.new([2, 1])), :*, ConstExpression.new(2)).evaluate

v1 = Vector.new([1, 2])
v2 = v0 + v1
v2.to_s

# 4.5
p Calc.from_expression(2, :+, 2.5).evaluate

# 3*2 + 4*(8+9)
a = Operator.new(ConstExpression.new(3), :*, ConstExpression.new(2))
b = Operator.new(ConstExpression.new(4), :*, Operator.new(ConstExpression.new(8), :+, ConstExpression.new(9)))
expression = Operator.new(a, :+, b)

p expression.to_s

# 74
p Calc.new(expression).evaluate