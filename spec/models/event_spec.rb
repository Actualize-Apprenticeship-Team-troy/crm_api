# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  name       :string
#  lead_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


require 'rails_helper'
describe "event factory" do
  it "proves the factory works" do
    expect(build :event).to be_valid
  end
end
