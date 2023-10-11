FactoryBot.define do
  factory :user do
    email     { Faker::Internet.email }
    password  { Faker::Internet.password }

    trait :confirmed do
      after(:create, &:confirm)
    end

    trait :with_profile do
      after(:create) { |user, _| create(:profile, user:) }
    end
  end
end
