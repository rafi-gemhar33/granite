# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

gem "rails", "~> 6.1.4", ">= 6.1.4.1"
# gem 'sqlite3', '~> 1.4'
gem "jbuilder", "~> 2.7"
gem "pg"
gem "puma", "~> 5.0"
gem "sass-rails", ">= 6"
gem "webpacker", "~> 5.0"

gem "bcrypt", "~> 3.1.13"
gem "bootsnap", ">= 1.4.4", require: false
gem "react-rails"
gem "responders", "~> 3.0"
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rubocop"
  gem "rubocop-rails"
end

group :development do
  gem "listen", "~> 3.3"
  gem "spring"
  gem "web-console", ">= 4.1.0"
end

group :test do
  gem "simplecov", require: false
end
