class Outreach < ApplicationRecord
  belongs_to :lead
  accepts_nested_attributes_for :lead

end
