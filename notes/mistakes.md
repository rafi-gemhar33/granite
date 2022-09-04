chapter: RESTful routes in Ruby on Rails
  https://www.bigbinary.com/books/learn-rubyonrails-book/restful-routes-in-ruby-on-rails#collection-routes
  The above code will add a delete_multiple RESTful action in the books_controller and GET requests on books/destroy_multiple will be routed to the delete_multiple action.

  https://www.bigbinary.com/books/learn-rubyonrails-book/restful-routes-in-ruby-on-rails#member-routes
  The above code will add a report RESTful action in the users_controller and GET requests on users/:id/destroy_multiple will be routed to the report action.

Chapter: Adding Tasks controller
  https://www.bigbinary.com/books/learn-rubyonrails-book/adding-tasks-controller#rails-mimeresponds
      respond_with(@tasks)
  We get error: undefined method `respond_to' for TasksController:Class
  As per Rails 5 release notes: https://github.com/rails/rails/blob/v5.0.0/actionpack/CHANGELOG.md
  Remove respond_to/respond_with placeholder methods, this functionality has been extracted to the responders gem.
  Add responders gem to your Gemfile.

  ERROR in ./app/javascript/packs/application.js
Module not found: Error: Can't resolve './src' in '/Users/rafi/Desktop/react-rails/granite/app/javascript/packs'
resolve './src' in '/Users/rafi/Desktop/react-rails/granite/app/javascript/packs'
  using description file: /Users/rafi/Desktop/react-rails/granite/package.json (relative path: ./app/javascript/packs)
    Field 'browser' doesn't contain a valid alias configuration