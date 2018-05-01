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

class Event < ApplicationRecord
  belongs_to :lead
end
