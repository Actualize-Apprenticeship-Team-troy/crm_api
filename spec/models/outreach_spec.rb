# == Schema Information
#
# Table name: outreaches
#
#  id            :integer          not null, primary key
#  outreach_text :string
#  lead_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

describe "#outreach" do 
  it "proves outreach factory works" do
    expect(build :outreach).to be_valid
  end
end
