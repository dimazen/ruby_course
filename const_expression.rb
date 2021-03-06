require_relative 'expression'

class ConstExpression < Expression
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def evaluate
    value
  end

  def to_s
    @value.to_s
  end

end