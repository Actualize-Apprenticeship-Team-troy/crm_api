# == Schema Information
#
# Table name: settings
#
#  id         :integer          not null, primary key
#  admin_id   :integer
#  auto_text  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :setting do 
    admin
    auto_text "Here is some text" 
  end 
end