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

require 'test_helper'

class DailyProgressLogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
