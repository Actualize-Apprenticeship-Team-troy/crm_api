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

class Setting < ApplicationRecord
  belongs_to :admin
end
