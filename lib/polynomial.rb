class Polynomial
  attr_reader :coefficient, :exponent, :polynomials

  def initialize(coefficient:, exponent:, polynomials: nil)
    @coefficient = coefficient
    @exponent = exponent
    @polynomials = polynomials
  end

  def differentiate
    polynomials.nil? ?
      self.class.new(coefficient: coefficient * exponent, exponent: exponent - 1) :
      self.class.new(coefficient: nil, exponent: nil, polynomials: polynomials.map(&:differentiate))
  end
end
