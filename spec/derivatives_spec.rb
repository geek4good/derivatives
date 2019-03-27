RSpec.describe "The Differentiation Web Service" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "returns the derivatives of a polymonial" do
    get "/differentiate/4/3/2/1"

    expect(last_response).to be_ok
    expect(last_response.body).to eq("12x^2+6x+2")
  end

  context "for invalid characters in the path" do
    it "returns an according status code and error message" do
      get "/differentiate/1/foo"

      expect(last_response.status).to eq(400)
      expect(last_response.body).to eq("Only integers are allowed in the path")
    end
  end
end
