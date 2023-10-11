require 'rails_helper'

feature 'Visits Home page' do
  context 'when visit page' do
    let(:category) { create(:category, name: 'Ruby') }

    scenario 'successfully' do
      visit root_path

      expect(page).to have_http_status(:success)
    end

    scenario 'should have footer' do
      visit root_path

      expect(page).to have_content '&COPY; MARCUS PEREIRA · TODOS OS DIREITOS RESERVADOS'
    end

    scenario 'should have only published contents' do
      user = create(:user)
      create(:profile, first_name: 'Marcus', last_name: 'Pereira', user:)
      post = create(:post, title: 'Creating columns in SQL database', status: :published, user:)

      visit root_path

      expect(page).to have_content 'Creating columns in SQL database'
      expect(page).to have_content "#{post.user.fullname} • #{I18n.l(post.created_at, format: :shortdate).titleize}"
      expect(page).to have_content 'Ruby'
    end

    scenario 'should have 6 published contents' do
      contents = create_list(:post, 8, category:)

      visit root_path

      contents.each do |_content|
        expect(page).to have_css('.contents article', count: 8)
      end
    end

    scenario 'should haven\'t content on draft status' do
      post = create(:post, status: :draft, category:)

      visit root_path

      expect(page).not_to have_content(post.title)
      expect(page).to have_content('Não existe conteúdo para exibir')
    end

    scenario 'should have DESC contents ordered' do
      travel_to 1.day.ago do
        create(:post, title: 'Ruby On Rails - Configure Active Record', category:)
      end
      travel_to 3.days.ago do
        create(:post, title: 'OOP With Ruby', category:)
      end
      freeze_time do
        create(:post, title: 'About Remix framework', category:)
      end

      visit root_path

      within 'section > div > div:nth-child(1) > article' do
        expect(page).to have_content('About Remix framework')
      end
      within 'section > div > div:nth-child(2) > article' do
        expect(page).to have_content('Ruby On Rails - Configure Active Record')
      end
      within 'section > div > div:nth-child(3) > article' do
        expect(page).to have_content('OOP With Ruby')
      end
    end
  end
end
