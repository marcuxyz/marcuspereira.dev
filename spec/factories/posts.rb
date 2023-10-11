FactoryBot.define do
  factory :post do
    title          { Faker::Lorem.sentence(word_count: 3) }
    slug           { title.parameterize }
    content        { Faker::Lorem.paragraph(sentence_count: 5) }
    status         { :published }
    news           { [true, false].sample }
    category
    user

    trait :with_embeded_video do
      after(:create) do |post|
        post.embeded_video =
          <<-VIDEO
            <iframe width="100%" height="675" src="https://www.youtube.com/embed/L9rtI1YPRwY?controls=0"
            title="YouTube video player" frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
            allowfullscreen></iframe>
          VIDEO
        post.save!
      end
    end

    trait :with_attachment do
      after(:create) do |post|
        post.attachment.attach(io: File.open('spec/support/files/code.rb'), filename: 'code.rb')
      end
    end

    trait :with_audio do
      after(:create) do |post|
        post.attachment.attach(io: File.open('spec/support/files/audio.m4a'), filename: 'audio.m4a')
      end
    end
  end
end
