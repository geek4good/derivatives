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
  end
end
