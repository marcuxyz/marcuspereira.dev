require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'presence' do
    it { should validate_presence_of(:name) }
  end

  context 'associations' do
    it { should have_many(:posts) }
  end

  context 'should have posts' do
    let(:category) { create(:category) }
    let!(:posts) { create_list(:post, 5, category:) }

    it { expect(category.posts.count).to eq(5) }
  end
end
