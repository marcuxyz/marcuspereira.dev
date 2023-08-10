4.times do
  FactoryBot.create(:post, category: FactoryBot.create(:category))
end
