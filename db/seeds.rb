
contacted = [true, false]
event_name = ['footer_form', 'tutorials', 'started application']

Admin.create(email: "test@test.com", password: "password", password_confirmation: "password")

50.times do
  Lead.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: Phoner::Phone.parse(Faker::PhoneNumber.phone_number, country_code: '1').to_s,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip,
    ip: Faker::Internet.ip_v4_address,
    contacted: contacted.sample,
    appointment_date: Faker::Date.between(2.days.ago, 1.month.from_now)
  )
end

100.times do
  event_creation_datetime = Faker::Time.between(20.days.ago, Date.today, :all)
  Event.create(
    name: event_name.sample,
    lead_id: rand(1..50),
    created_at: event_creation_datetime,
    updated_at: event_creation_datetime
  )
end

5.times do
  Outreach.create(
    outreach_text: "Lead outreach 1",
    lead_id: 1
    )
end
Outreach.create( outreach_text: "Lead outreach 2", lead_id: 2)
Outreach.create( outreach_text: "Lead outreach 3", lead_id: 3)
Outreach.create( outreach_text: "Lead outreach 4", lead_id: 4)
