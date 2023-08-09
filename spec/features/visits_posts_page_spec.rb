require 'rails_helper'

feature 'Visits Post page' do
  context 'when visit page' do
    let(:category) { create(:category, name: 'Ruby') }

    scenario 'through of home page' do
      post = create(:post, status: :published, category:)

      visit root_path
      click_on post.title

      expect(page).to have_http_status(:success)
      expect(page).to have_content(post.title)
    end

    scenario 'should view post' do
      post = create(:post, status: :published, category:)

      visit post_path(post)

      expect(page).to have_content(post.title)
      expect(page).to have_content(post.content.to_plain_text)
    end

    scenario 'should view the post if it has been published' do
      post = create(:post, :with_embeded_video, status: :draft, category:)

      visit post_path(post)

      expect(page).to have_content('Conteúdo não encontrado!')
      expect(page).not_to have_content(post.title)
      expect(page).not_to have_content(post.content)
      expect(page).not_to have_content(post.embeded_video)
    end

    scenario 'should view the post that contains audio' do
      post = create(:post, status: :published, category:)
      post.attachment.attach(io: File.open('spec/support/files/audio.m4a'), filename: 'audio.m4a')

      visit post_path(post)

      expect(page).to have_css("audio[src*='audio.m4a']")
    end
  end
end
