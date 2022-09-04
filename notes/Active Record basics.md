## Active Record basics
* Task.where(status: "active")

ActiveRecord::Base is a Rails class that contains several helper methods

* class Book will be mapped to books table.

* Rails uses Inflector

* Overriding table names

```
class Task < ApplicationRecord
  self.table_name = "app_tasks"
end
```

Foreign keys
User(Model) => users(table) => user_id(foreign_key)

There are some cases like `upsertion`, where Active Record won't automatically populate a value for these special columns.