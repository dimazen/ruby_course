require_relative 'expression'
require_relative 'operation'

class Operator < Expression

  def initialize(lhs, type, rhs)
    @type = type
    @lhs = lhs
    @rhs = rhs
  end

  def evaluate
    lhs_value = @lhs.evaluate
    rhs_value = @rhs.evaluate

    operation = OperationFactory.operation_for_values lhs_value, rhs_value, @type

    if operation != nil
      operation.evaluate
    else
      raise Exception.new "Can not handle #{@type} for #{@lhs} and #{@rhs}"
    end

  end

  def to_s
    "(#{@lhs} #{@type.to_s} #{@rhs})"
  end

end