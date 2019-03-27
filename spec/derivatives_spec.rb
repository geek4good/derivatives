root = File.expand_path("../..", __FILE__)
$LOAD_PATH.unshift(root) unless $LOAD_PATH.include?(root)

ENV["APP_ENV"] = "test"

require "derivatives"

require "rack/test"
require "rspec"

describe "The Differentiation Web Service" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "returns the derivatives of a polymonial" do
    get "/differentiate/4/3/2/1"

    expect(last_response).to be_ok
    expect(last_response.body).to eq("12x^2+6x+2")
  end
end
