require "sinatra"
require "sinatra/reloader" if development?

require "polynomial"

get "/differentiate/*" do
  coefficients = parse_coefficients!(params[:splat].first) or return

  polynomials = coefficients.map.with_index(1) do |coefficient, position|
    Polynomial.new(coefficient: coefficient, exponent: coefficients.length - position)
  end

  (polynomials.size > 1 ? Polynomial.new(polynomials: polynomials) : polynomials.first).
    differentiate.
    to_s
end

private

def parse_coefficients!(path)
  path.split("/").map { |segment| Integer(segment) }
rescue ArgumentError
  status 400
  body "Only integers are allowed in the path"
  nil
end
