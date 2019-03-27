class Polynomial
  attr_reader :coefficient, :exponent, :polynomials

  def initialize(coefficient: nil, exponent: nil, polynomials: nil)
    @coefficient = coefficient
    @exponent = exponent
    @polynomials = polynomials

    [coefficient, exponent, polynomials].all?(&:nil?) ||
      polynomials.nil? && [coefficient, exponent].any?(&:nil?) and
      fail ArgumentError.new("Either pass polynomials or a coefficient along with an exponent")
  end

  def differentiate
    polynomials.nil? ?
      self.class.new(coefficient: coefficient * exponent, exponent: exponent - 1) :
      self.class.new(polynomials: polynomials.map(&:differentiate))
  end
end
