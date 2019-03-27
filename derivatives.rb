require "sinatra"
require "sinatra/reloader" if development?

get "/differentiate/*" do
  coefficients = parse_coefficients!(params[:splat].first) or return

  polynomials = coefficients.map.with_index(1) do |coefficient, position|
    Polynomial.new(coefficient: coefficient, exponent: length - position)
  end

  polynomials.size > 1 ? Polynomial.new(polynomials: polynomials) : polynomials.first
end

private

def parse_coefficients!(str)
  str.split("/").map { |segment| Integer(segment) }
end
