FactoryBot.define do
  factory :profile do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    user

    trait :with_user do
      after(:create) { |profile, _| create(user, profile:) }
    end
  end
end
