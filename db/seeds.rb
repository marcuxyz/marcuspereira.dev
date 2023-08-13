User.create(email: 'hi@example.com', password: 'Ts283c#20Cab')

4.times do
  FactoryBot.create(:post, category: FactoryBot.create(:category))
end
