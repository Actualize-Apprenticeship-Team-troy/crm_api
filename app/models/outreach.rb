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

class Outreach < ApplicationRecord
  belongs_to :lead
  accepts_nested_attributes_for :lead

end
