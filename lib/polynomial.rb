class Polynomial
  attr_reader :coefficient, :exponent, :polynomials

  def initialize(coefficient:, exponent:, polynomials: nil)
    @coefficient = coefficient
    @exponent = exponent
    @polynomials = polynomials
  end

  def differentiate
    self.class.new(coefficient: coefficient * exponent, exponent: exponent - 1)
  end
end
