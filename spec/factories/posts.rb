FactoryBot.define do
  factory :post do
    title          { Faker::Lorem.sentence(word_count: 3) }
    slug           { title.parameterize }
    content        { Faker::Lorem.paragraph(sentence_count: 5) }
    description    { Faker::Lorem.paragraph(sentence_count: 15) }
    status         { :published }
    category

    embeded_video do
      <<-VIDEO
        <iframe width="100%" height="675" src="https://www.youtube.com/embed/L9rtI1YPRwY?controls=0"
        title="YouTube video player" frameborder="0"
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
        allowfullscreen></iframe>
      VIDEO
    end

    trait :with_attachment do
      after(:create) do |post|
        post.attachment.attach(io: File.open('spec/support/files/code.rb'), filename: 'code.rb')
      end
    end
  end
end
