require "spec_helper"
require "quarry"

RSpec.describe Quarry do
  it "has a version number" do
    expect(Quarry::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end

RSpec.describe Quarry::HTTP do 
	it "gets a page" do
		body = Quarry::HTTP.get("http://google.com")
		puts body
		expect(body).to include("<html>")
	end
end

