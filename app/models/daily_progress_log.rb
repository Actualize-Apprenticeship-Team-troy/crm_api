# == Schema Information
#
# Table name: daily_progress_logs
#
#  id         :integer          not null, primary key
#  admin_id   :integer
#  date       :date
#  processed  :integer          default(0)
#  connects   :integer          default(0)
#  sets       :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DailyProgressLog < ApplicationRecord
  belongs_to :admin
end
