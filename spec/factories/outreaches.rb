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

FactoryBot.define do
  factory :outreach do 
    lead
    outreach_text "Here is some text" 
  end 
end