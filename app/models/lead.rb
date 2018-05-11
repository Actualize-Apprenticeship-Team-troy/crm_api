# == Schema Information
#
# Table name: leads
#
#  id                        :integer          not null, primary key
#  first_name                :string
#  last_name                 :string
#  email                     :string
#  phone                     :string
#  ip                        :string
#  city                      :string
#  state                     :string
#  zip                       :string
#  contacted                 :boolean          default(FALSE)
#  appointment_date          :datetime
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  notes                     :text
#  connected                 :boolean          default(FALSE)
#  bad_number                :boolean          default(FALSE)
#  advisor                   :string
#  location                  :string
#  standard_phone            :string
#  exclude_from_calling      :boolean          default(FALSE)
#  process_time              :datetime
#  hot                       :boolean          default(TRUE)
#  first_appointment_set     :date
#  first_appointment_actual  :date
#  first_appointment_format  :string
#  second_appointment_set    :date
#  second_appointment_actual :date
#  second_appointment_format :string
#  enrolled_date             :date
#  deposit_date              :date
#  sales                     :integer
#  collected                 :integer
#  status                    :string
#  next_step                 :string
#  rep_notes                 :text
#  number_of_dials           :integer          default(0)
#  old_lead                  :boolean          default(FALSE)
#  meeting_type              :string
#  meeting_format            :string
#  ip_state                  :string
#  online                    :boolean          default(FALSE)
#

class Lead < ApplicationRecord
  has_many :events
  has_many :outreaches
  accepts_nested_attributes_for :outreaches
  before_save :standardize_phone

  attr_accessor :call_mode

  # The algorithm that decides which lead the call converter should call next
  # based on which lead is most likely to lead to a successful call. This algorithm
  # may change based on which call converter is calling.
  def self.next(admin_email=nil)
    return Lead.joins(:events).where(old_lead: false).where(exclude_from_calling: false).where(contacted: false).where(bad_number: false).where('enrolled_date is null').where("phone <> ''").where("events.name = 'Started Application'").order(:updated_at).last
  end

  # Send an automated text to a lead:
  def text
    @client = Twilio::REST::Client.new
    @client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: self.phone,
      body: 'Hi - this is Rena from Actualize. Do you have a minute to chat?'
    )
  end

  def full_name
    "#{self.try(:first_name).try(:capitalize)} #{self.try(:last_name).try(:capitalize)}"
  end

  def processed_within_minutes
    return 'not called' unless self.process_time
    number_of_seconds = self.process_time - self.created_at
    return "#{(number_of_seconds / 60).to_i} minutes"
  end

  # Reset a lead as if it's brand new. This is useful for manual testing.
  def reset
    self.update(hot: true, contacted: false, connected: false, exclude_from_calling: false, appointment_date: nil, advisor: nil, number_of_dials: 0)
  end

  private

  def standardize_phone
    begin
      self.standard_phone = Phoner::Phone.parse(self.phone, country_code: '1').to_s
    rescue
      # We'll ignore an exception that could happen if the given phone 
      # number has a very unusual format
    end
  end

  def should_be_left_a_message
    # We tried dialing a valid number but the lead didn't answer their phone:
    self.contacted && !self.bad_number && !self.connected
  end
end
