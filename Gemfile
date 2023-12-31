source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'

gem 'importmap-rails'
gem 'jbuilder'
gem 'pg', '~> 1.1'
gem 'puma', '~> 6.0'
gem 'pundit', '~> 2.3'
gem 'rails', '~> 7.1'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'avo'
gem 'aws-sdk-s3', '~> 1.132'
gem 'bootsnap', require: false
gem 'devise', '~> 4.9'
gem 'friendly_id', '~> 5.5'
gem 'image_processing', '~> 1.2'
gem 'sassc-rails'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]

  gem 'bundle-audit', '~> 0.1.0'
  gem 'bundler-audit', '~> 0.9.1'
  gem 'capybara'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails', '~> 6.0.0'
  gem 'shoulda-matchers', '~> 5.0'
end

group :development do
  gem 'rubocop', '~> 1.52', require: false
  gem 'rubocop-capybara', require: false
  gem 'rubocop-rails', require: false
  gem 'web-console'
end
