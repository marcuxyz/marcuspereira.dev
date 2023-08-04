require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'presence' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:slug) }

    context 'associations' do
      it { should belong_to(:category) }
    end

    context 'should have specific status' do
      it { should define_enum_for(:status) }
      it do
        should define_enum_for(:status).with_values %i[draft published]
      end
    end

    it 'should have categories' do
      category = create(:category)
      post = create(:post, category:)

      expect(post.category).to eq(category)
    end

    it 'should create slug' do
      category = create(:category)
      post = create(:post, title: 'Creating columns in SQL database', category:)

      expect(post.slug).to be_present
      expect(post.slug).to eq('creating-columns-in-sql-database')
    end
  end
end
