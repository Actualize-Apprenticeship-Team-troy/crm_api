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

FactoryBot.define do
  factory :lead do
    first_name "raul"
    last_name "sung"
    hot true
  end
end










