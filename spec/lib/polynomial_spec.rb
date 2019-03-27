RSpec.describe Polynomial do
  subject(:polynomial) { described_class.new(coefficient: coefficient, exponent: exponent) }
  let(:coefficient) { 7 }
  let(:exponent) { 3 }

  describe "#initialize" do
    it "assigns the coefficient" do
      expect(polynomial.coefficient).to eq(coefficient)
    end

    it "assigns the exponent" do
      expect(polynomial.exponent).to eq(exponent)
    end

    it "defaults to assigning nil to polynomials" do
      expect(polynomial.polynomials).to be_nil
    end

    context "when polynomials given" do
      subject(:polynomial) { described_class.new(coefficient: nil, exponent: nil, polynomials: polynomials) }
      let(:polynomials) { [] }

      it "assigns the polynomials" do
        expect(polynomial.polynomials).to eq(polynomials)
      end
    end
  end

  describe "#differenciate" do
    it "returns the polynomial's derivative" do
      derivative = polynomial.differentiate

      expect(derivative.coefficient).to eq(21)
      expect(derivative.exponent).to eq(2)
    end

    context "for complex polynomials" do
      subject(:polynomial) { described_class.new(coefficient: nil, exponent: nil, polynomials: polynomials) }
      let(:polynomials) { [first_polynomial, second_polynomial] }

      let(:first_polynomial) { described_class.new(coefficient: first_coefficient, exponent: first_exponent) }
      let(:first_coefficient) { 4 }
      let(:first_exponent) { 3 }

      let(:second_polynomial) { described_class.new(coefficient: second_coefficient, exponent: second_exponent) }
      let(:second_coefficient) { 3 }
      let(:second_exponent) { 2 }

      it "returns the polynomial's derivative, which is the sum of the first and second polynomials' derivatives" do
        derivative = polynomial.differentiate
        first_derivative = derivative.polynomials.first
        second_derivative = derivative.polynomials.last

        expect(first_derivative.coefficient).to eq(12)
        expect(first_derivative.exponent).to eq(2)

        expect(second_derivative.coefficient).to eq(6)
        expect(second_derivative.exponent).to eq(1)
      end
    end
  end
end
