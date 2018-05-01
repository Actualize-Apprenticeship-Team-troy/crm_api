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

require 'test_helper'

class OutreachTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
