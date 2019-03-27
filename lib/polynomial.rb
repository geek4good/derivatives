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

  def to_s
    polynomials.nil? ?
      as_string :
      polynomials.map { |p| p.send(:as_string) }.reject { |s| s == "0" }.join("+")
  end

  private

  def as_string
    return "0" if coefficient.zero?
    return "1" if coefficient == 1 && exponent.zero?

    output = ""
    output << coefficient.to_s if coefficient > 1
    output << "x" if exponent > 0
    output << "^#{exponent}" if exponent > 1

    return output
  end
end
