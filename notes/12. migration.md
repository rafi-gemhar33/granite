## Rails migration?


* bundle exec rails generate migration CreateTasks

```
class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.text :title
      t.timestamps
    end
  end
end
```

* in rails console: ActiveRecord::Base.connection.tables

* rails db:schema:load => loads the schema mentioned in db/schema.rb

* bundle exec rails db:migrate:status

* def up & def down for rollback

```
class DeleteTasksTable < ActiveRecord::Migration[6.1]
  def change
    execute 'DELETE FROM tasks'
  end
end
```

* bundle exec rails  -T db
rails db:create
rails db:drop
rails db:environment:set
rails db:fixtures:load
rails db:migrate
rails db:migrate:status
rails db:prepare
rails db:rollback
rails db:schema:cache:clear
rails db:schema:cache:dump
rails db:schema:dump
rails db:schema:load
rails db:seed
rails db:seed:replant
rails db:setup
rails db:structure:dump
rails db:structure:load
rails db:version
rails test:db

* Don't edit existing migrations
