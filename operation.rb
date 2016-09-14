require_relative 'types/vector'

class OperationFactory

  class << self

    def known_operations
      [
          NumericOperation,
          VectorToNumericOperation
      ]
    end

    def operation_for_values(lhs, rhs, type)
      index = known_operations.index { |x| x.can_evaluate(lhs, rhs, type) }
      known_operations[index].new(lhs, rhs, type) unless index.nil?
    end

  end

end

class Operation

  attr_reader :lhs
  attr_reader :rhs
  attr_reader :type

  def self.can_evaluate(lhs, rhs, type)
    false
  end

  def initialize(lhs, rhs, type)
    @lhs = lhs
    @rhs = rhs
    @type = type
  end

  def evaluate
    raise NotImplementedError.new
  end

end

class NumericOperation < Operation

  def self.can_evaluate(lhs, rhs, type)
    lhs.kind_of?(Numeric) && rhs.kind_of?(Numeric) && [:+, :-, :*, :/].find_index(type) != nil
  end

  def evaluate
    lhs.method(type).call(rhs)
  end

end

class VectorToNumericOperation < Operation

  def self.can_evaluate(lhs, rhs, type)
    case type
      when :*, :/
        return lhs.kind_of?(Vector) && rhs.kind_of?(Numeric) || lhs.kind_of?(Numeric) && rhs.kind_of?(Vector)
      else
        return nil
    end
  end

  def evaluate
    vector = lhs.kind_of?(Vector) ? lhs : rhs
    number = rhs.kind_of?(Numeric) ? rhs : lhs

    Vector.new vector.values.map { |x| x * number }
  end

end