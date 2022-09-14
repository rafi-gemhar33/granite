- Rails makes use of the `ActiveSupport::Logger`

```ruby
config.logger = Logger.new(STDOUT) # config.logger = Log4r::Logger.new("Application Log")

rescue => e
  logger.error e.message
  e.backtrace.each { |line| logger.error line }

# config/initializers/backtrace_silencers.rb
 Rails.backtrace_cleaner.remove_silencers!
```
