require_relative 'expression'
require_relative 'operator'
require_relative 'operand'

class Calc

  def initialize(expression)
    @expression = expression
  end

  def self.from_expression(lhs, operator, rhs)
    lhs_object = OperandFactory.operand_for_value lhs
    rhs_object = OperandFactory.operand_for_value rhs
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

# 4.5
p Calc.from_expression(2, :+, 2.5).evaluate

# 3*2 + 4*(8+9)
a = Operator.new(Operand.new(3), :*, Operand.new(2))
b = Operator.new(Operand.new(4), :*, Operator.new(Operand.new(8), :+, Operand.new(9)))
expression = Operator.new(a, :+, b)

p expression.to_s

# 74
p Calc.new(expression).evaluate