RSpec.describe Polynomial do
  describe "#initialize" do
    it "fails by default" do
      expect { described_class.new }.to raise_error(ArgumentError)
    end

    context "when coefficient and exponent are given" do
      subject(:polynomial) { described_class.new(coefficient: coefficient, exponent: exponent) }
      let(:coefficient) { 7 }
      let(:exponent) { 3 }

      it "assigns the coefficient" do
        expect(polynomial.coefficient).to eq(coefficient)
      end

      it "assigns the exponent" do
        expect(polynomial.exponent).to eq(exponent)
      end

      it "defaults to assigning nil to polynomials" do
        expect(polynomial.polynomials).to be_nil
      end
    end

    context "when polynomials are given" do
      subject(:polynomial) { described_class.new(polynomials: polynomials) }
      let(:polynomials) { [first_polynomial, second_polynomial] }

      let(:first_polynomial) { described_class.new(coefficient: first_coefficient, exponent: first_exponent) }
      let(:first_coefficient) { 4 }
      let(:first_exponent) { 3 }

      let(:second_polynomial) { described_class.new(coefficient: second_coefficient, exponent: second_exponent) }
      let(:second_coefficient) { 3 }
      let(:second_exponent) { 2 }

      it "assigns the polynomials" do
        expect(polynomial.polynomials).to eq(polynomials)
      end

      it "defaults to assigning nil to coefficient" do
        expect(polynomial.coefficient).to be_nil
      end

      it "defaults to assigning nil to exponent" do
        expect(polynomial.exponent).to be_nil
      end
    end
  end

  describe "#differenciate" do
    subject(:polynomial) { described_class.new(coefficient: coefficient, exponent: exponent) }
    let(:coefficient) { 7 }
    let(:exponent) { 3 }

    it "returns the polynomial's derivative" do
      derivative = polynomial.differentiate

      expect(derivative.coefficient).to eq(21)
      expect(derivative.exponent).to eq(2)
    end

    context "for complex polynomials" do
      subject(:polynomial) { described_class.new(polynomials: polynomials) }
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
