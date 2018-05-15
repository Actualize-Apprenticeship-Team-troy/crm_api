require 'rails_helper'

describe "#setting" do
  it "proves settings factory works" do
    expect(build :setting).to be_valid   
  end
end