# == Schema Information
#
# Table name: admins
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  role                   :string
#

require 'rails_helper'

RSpec.describe Admin, type: :model do 
  describe "associations and attributes" do 
     it { should have_one(:setting)}
     it { should have_many(:daily_progress_logs)}

  end


  describe "#admin" do
    it "proves admin factory works" do 
      expect(build :admin).to be_valid   
    end 
  end

  describe "#email" do
    it "expect email" do
      admin = create(:admin)
      expect(admin.email).to eq("actualize@co.com")
    end
  end


  describe "#email" do 
    it "should validate presence" do
      admin = create(:admin)
      admin.email = nil
      expect(admin).not_to be_valid
      
    end
  end

  describe "#email" do 
      it "should validate presence email" do
        admin = create(:admin)
        admin.email = " "
        expect(admin).not_to be_valid
    end
  end

  describe "#first_name" do
    it "expect correct first name" do
      admin = create(:admin)
      expect(admin.first_name).to eq("Raul")
    end
  end

  describe "#last_name" do
    it "expect correct last name" do
      admin = create(:admin)
      expect(admin.last_name).to eq("roman")
    end
  end

  describe "#password" do
    it "should validate presence password" do
      admin = create(:admin)
      expect(admin.password).to eq("password")
    end
  end

  describe "#password" do 
    it "should validate presence of password nil" do
      admin = create(:admin)
      admin.password = nil
      expect(admin).not_to be_valid
    end
  end

  describe "#password" do 
    it "should validate presence password" do
      admin = create(:admin)
      admin.password = ""
      expect(admin).not_to be_valid
    end
  end

end



