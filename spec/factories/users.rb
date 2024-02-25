FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password123' }
    name { Faker::Name.name }
    mobile_number { Faker::PhoneNumber.cell_phone }
  end
end