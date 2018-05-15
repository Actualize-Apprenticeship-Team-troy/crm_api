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

require 'rails_helper'

RSpec.describe Lead, type: :model do 
  describe "testing associations and attribute types" do
   it { should have_many(:events)}
   it { should have_many(:outreaches)}
   it { should have_db_column(:hot).of_type(:boolean)}
   it { should have_db_column(:number_of_dials).of_type(:integer)} 
   it { should have_db_column(:old_lead).of_type(:boolean)}
   it { should have_db_column(:meeting_type).of_type(:string)}
   it { should have_db_column(:meeting_format).of_type(:string)}  
   it { should have_db_column(:ip_state).of_type(:string)}
   it { should have_db_column(:online).of_type(:boolean)}  
   it { should  have_db_column(:fake_news).of_type(:string)}
  end 

  describe "#full_name" do
    it "expect correct full name" do
      lead = create(:lead)
      expect(lead.full_name).to eq("Raul Sung")
    end

    it "expect to handle nils" do
      lead = create(:lead, 
                    first_name: "kim",
                    last_name: nil)
      expect(lead.full_name).to eq("Kim ")
    end
  end
  describe "#reset" do
    it "expect lead to be reset" do
      lead = create(:lead,
                    hot: false,
                    contacted: true,
                    connected: true,
                    exclude_from_calling: true,
                    appointment_date: DateTime.now,
                    advisor: "troy",
                    number_of_dials: 5,
                    bad_number: true)
      lead.reset
      expect(lead[:hot]).to be(true)
      expect(lead[:contacted]).to be(false)
      expect(lead[:connected]).to be(false)
      expect(lead[:exclude_from_calling]).to be(false)
      expect(lead[:appointment_date]).to be(nil)
      expect(lead[:advisor]).to be(nil)
      expect(lead[:number_of_dials]).to be(0)
      expect(lead[:bad_number]).to be(false)
    end
  end
  


end






