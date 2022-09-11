- In our case, using find_each method allows us to query records in batches,
  thereby increasing the efficiency.
- Since set_slug is a private method in our Task model, it is not accessible to
  the task objects we are calling the method on.
- before_create :set_slug

```
    def slug_not_changed
      if slug_changed? && self.persisted?
        errors.add(:slug, 'is immutable!')
      end
    end
```

- i18n is "Ruby internationalization and localization solution".

```
Let's create en.yml file in config/locales and add the following code:

en:
  task:
    slug:
      immutable: "is immutable!"
```

- In every controller, we can use t() method without including any additional
  modules since AbstractController::Translation is already included in
  ActionController::Base.

- is_sqlite_db =
  ActiveRecord::Base.connection_db_config.configuration_hash[:adapter] ==
  "sqlite3"

```

<!-- config/initializers/sqlite_custom_regexp_function.rb -->

ActiveRecord::ConnectionAdapters::AbstractAdapter.class_eval do alias_method
:orig_initialize, :initialize

def initialize(connection, logger = nil, pool = nil) orig_initialize(connection,
logger, pool)

    is_sqlite_db = ActiveRecord::Base.connection_db_config.configuration_hash[:adapter] == "sqlite3"

    if is_sqlite_db
      connection.create_function("regexp", 2) do |fn, pattern, expr|
        regex_matcher = Regexp.new(pattern.to_s, Regexp::IGNORECASE)
        fn.result = expr.to_s.match(regex_matcher) ? 1 : 0
      end
    end

end end

```

- sqlite3_create_function()

```
def create_function name, arity, text_rep=Constants::TextRep::UTF8, &block
  define_function_with_flags(name, text_rep) do |*args|
    fp = FunctionProxy.new
    block.call(fp, *args)
    fp.result
  end
  self
end
```
