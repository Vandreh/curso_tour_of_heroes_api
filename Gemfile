source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'puma', '~> 5.0'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "active_model_serializers", "~> 0.10.12"
gem "rack-cors", "~> 1.1"
gem "rubocop", require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'sqlite3', '~> 1.4'
  gem "rspec-rails", "~> 5.0"
  gem "factory_bot_rails", "~> 6.2"
  gem "faker", "~> 2.19"
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem "spring-commands-rspec", "~> 1.0"
end

group :test do
  gem "shoulda-matchers", "~> 5.0"
  gem "simplecov", "~> 0.21.2", require: false
end

group :production do
  gem "pg", "~> 1.2"
end



