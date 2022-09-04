gem 'react-rails'
bundle install
bundle exec rails webpacker:install 
yarn list --pattern "{webpacker,webpack-dev-server}"

bundle exec rails webpacker:install:react
bundle exec rails generate react:install
