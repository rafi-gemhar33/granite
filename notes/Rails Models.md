## Rails Models

```
class Task < ApplicationRecord
  self.table_name = "task_apac"
end
```

## Model validations

- validates :title, presence: true
- validates :slug, uniqueness: true

- change_column_null :tasks, :title, false
- add_column :tasks, :slug, :string
- add_index :tasks, :slug, unique: true

ActiveRecord::Base.connection.execute(sql)

## console

- underscore(\_), to retrieve the result of the last expression.
- bundle exec rails console -e staging
- bundle exec rails console -e production --sandbox
- $ bundle exec rails console -- --simple-prompt
