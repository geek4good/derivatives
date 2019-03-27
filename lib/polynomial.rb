class Polynomial
  attr_reader :coefficient, :exponent, :polynomials

  def initialize(coefficient:, exponent:, polynomials: nil)
    @coefficient = coefficient
    @exponent = exponent
    @polynomials = polynomials
  end
end
