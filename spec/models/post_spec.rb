require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'presence' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
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

    context 'should update slug if title changed' do
      let(:post) { create(:post, title: 'Desenvolvendo aplicações com Ruby') }

      it {
        expect do
          post.update!(title: 'Sinatra como API!')
        end.to change(post, :slug).from('desenvolvendo-aplicacoes-com-ruby').to('sinatra-como-api')
      }
    end

    context 'should have 7 minutes to read content' do
      let(:post) { create(:post, content: Faker::Lorem.paragraph(sentence_count: 550)) }

      it { expect(post.estimated_reading_time).to eq('7 minutos de leitura') }
    end

    context 'should have 0 minutes to read content' do
      let(:post) { create(:post, content: Faker::Lorem.paragraph(sentence_count: 5)) }

      it { expect(post.estimated_reading_time).to eq('1 minuto de leitura') }
    end

    context 'must be news' do
      let(:post) { create(:post, news: true) }

      it { expect(post.news?).to be_truthy }
    end

    context 'should have category' do
      let(:category) { create(:category) }
      let(:post) { create(:post, category:) }

      it { expect(post.category).to eq(category) }
    end

    context 'should have attachments' do
      let(:post) { create(:post, :with_attachment) }

      it { expect(post.attachment.attached?).to be_truthy }
    end

    context 'should create slug' do
      let(:post) { create(:post, title: 'Creating columns in SQL database') }

      it { expect(post.slug).to be_present }
      it { expect(post.slug).to eq('creating-columns-in-sql-database') }
    end

    context 'should have audio' do
      let(:post) { create(:post, :with_audio) }

      it { expect(post.attachment.attached?).to be_truthy }
      it { expect(post.attachment.content_type).to eq('audio/mp4') }
    end
  end
end
