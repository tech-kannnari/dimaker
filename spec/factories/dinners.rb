FactoryBot.define do
  factory :dinner do
    impression { '調理完了' }
    cookday    { Faker::Date }
    association :user

    after(:build) do |dinner|
      dinner.image.attach(io: File.open('public/images/omuraisu.png'), filename: 'omuraisu.png')
    end
  end
end
