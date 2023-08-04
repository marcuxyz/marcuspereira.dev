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
      expect(page).to have_content(post.content)
    end

    scenario 'should view the post if it has been published' do
      post = create(:post, status: :draft, category:)

      visit post_path(post)

      expect(page).to have_content('Conteúdo não encontrado!')
      expect(page).not_to have_content(post.title)
      expect(page).not_to have_content(post.content)
      expect(page).not_to have_content(post.embeded_video)
    end
  end
end
