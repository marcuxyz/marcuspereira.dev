require 'rails_helper'

feature 'Visits Posts page' do
  context 'when visit pages' do
    scenario 'through of home page' do
      post = create(:post, status: :published)

      visit root_path
      click_on 'Exibir todas as notas'

      expect(page).to have_http_status(:success)
      expect(page).to have_content(post.title)
    end

    scenario 'show the 10 published posts' do
      post = create_list(:post, 10, status: :published)

      visit posts_path

      post.each do |_|
        expect(page).to have_css('.published_content', count: 10)
      end
    end

    scenario 'must have only published posts' do
      published_post = create(:post, status: :published)
      draft_post = create(:post, status: :draft)

      visit posts_path

      expect(page).to have_content(published_post.title)
      expect(page).not_to have_content(draft_post.title)
    end

    xscenario 'should be able to fetch posts', js: true do
      post = create(:post, status: :published)
      create(:post, title: 'Ruby On rAIlS', status: :published)

      visit posts_path
      fill_in 'q', with: 'Ruby On rAIlS'

      find_field('#q').click

      expect(page).not_to have_content(post.title)
      # expect(page).to have_content('Ruby On rAIlS', count: 1)
    end

    scenario 'must redirect to post page' do
      post = create(:post, status: :published)

      visit posts_path
      click_on post.title

      expect(current_path).to eq post_path(post)
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.content.to_plain_text)
    end
  end
end
