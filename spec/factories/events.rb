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
 


FactoryBot.define do
  factory :event do
    lead
    name "raul"
  end
end