require_relative 'expression'

class Operand < Expression
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def evaluate
    value
  end

  # Arithmetic

  def +(argument)
    value + argument.evaluate
  end

  def -(argument)
    value - argument.evaluate
  end

  def *(argument)
    value * argument.evaluate
  end

  def /(argument)
    value / argument.evaluate
  end

  def to_s
    @value.to_s
  end

end


class OperandFactory

  def self.operand_for_value(value)
    Operand.new value
  end

end