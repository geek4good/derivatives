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

  it "says hello" do
    get "/"

    expect(last_response).to be_ok
    expect(last_response.body).to eq("Hello world!")
  end
end
