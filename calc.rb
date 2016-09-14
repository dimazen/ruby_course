require_relative 'expression'
require_relative 'operator'
require_relative 'operand'
require_relative 'types/vector'

class Calc

  def initialize(expression)
    @expression = expression
  end

  def self.from_expression(lhs, operator, rhs)
    lhs_object = Operand.new lhs
    rhs_object = Operand.new rhs
    operator_object = Operator.new lhs_object, operator, rhs_object
    self.new operator_object
  end

  def evaluate
    @expression.evaluate
  end

  def to_s
    @expression.to_s
  end

end


v0 = Vector.new([2, 1])
v1 = Vector.new([1, 2])
v2 = v0 + v1
v2.to_s

# 4.5
p Calc.from_expression(2, :+, 2.5).evaluate

# 3*2 + 4*(8+9)
a = Operator.new(Operand.new(3), :*, Operand.new(2))
b = Operator.new(Operand.new(4), :*, Operator.new(Operand.new(8), :+, Operand.new(9)))
expression = Operator.new(a, :+, b)

p expression.to_s

# 74
p Calc.new(expression).evaluate