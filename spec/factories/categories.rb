FactoryBot.define do
  factory :category do
    name { Faker::ProgrammingLanguage.name }

    trait :with_posts do
      after(:create) { |category| create_list(:post, 3, category:) }
    end
  end
end
