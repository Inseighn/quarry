require "spec_helper"
require "quarry"
require "webmock/rspec"

RSpec.describe Quarry do
  it "has a version number" do
    expect(Quarry::VERSION).not_to be nil
  end

end

RSpec.describe Quarry::HTTP do 
	it "gets a page" do
		WebMock.reset!
		stub =stub_request(:get, "www.example.com")
		Quarry::HTTP.get("http://www.example.com")
		expect(stub).to have_been_requested
	end

	it "gets a page with parameters" do
		WebMock.reset!
		stub = stub_request(:get, "www.example.com").with(query: {:test_param => "julius"})
		Quarry::HTTP.get("http://www.example.com", {:test_param => "julius"})
		expect(stub).to have_been_requested 
	end

	it "gets a page with headers" do
		WebMock.reset!
		stub = stub_request(:get, "www.example.com").with(headers: {:test_param => "julius"})
		Quarry::HTTP.get("http://www.example.com", {}, {:test_param => "julius"})
		expect(stub).to have_been_requested 
	end

end

