FactoryBot.define do
  factory :user do
    nickname              { 'Tom' }
    email                 { Faker::Internet.email }
    password              { '000000o' }
    password_confirmation { '000000o' }
  end
end
