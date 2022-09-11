```ruby
  assert_includes @preference.errors.messages[:notification_delivery_hour], t('errors.messages.blank')

#========================
  invalid_hours.each do |hour|
    @preference.notification_delivery_hour = hour
    assert @preference.invalid?
  end
#========================
  travel_to DateTime.parse(default_mail_delivery_time)

#========================
# travel_to helper changes the current time to the given time by stubbing Time.now, Date.today, and DateTime.now to return the time or date passed into this method. The stubs are automatically removed at the end of the test.
  assert_difference -> { @user.user_notifications.count }, 1 do
      TodoNotificationsWorker.perform_async
  end

#========================
# /sidekiq_helper.rb

module SidekiqHelper
  def clear_redis_data
    Sidekiq.redis do |conn|
      conn.keys("cron_job*").each do |key|
        conn.del(key)
      end
    end
  end

  def clear_sidekiq_queues
    Sidekiq::Queue.all.each do |queue|
      queue.clear
    end
  end

  def after_teardown
    Sidekiq::Worker.clear_all
    super
  end
end

# test_helper
Dir[Rails.root.join("test/support/**/*.rb")].each { |f| require f }
#========================

 def test_task_mailer_is_delivering_mails
    email = TaskMailer.pending_tasks_email(@user.id).deliver_now
    assert_not ActionMailer::Base.deliveries.empty?
    assert_equal ["no-reply@granite.com"], email.from
    assert_equal [@user.email], email.to
    assert_equal "Pending Tasks", email.subject
  end

  email = TaskMailer.pending_tasks_email("").deliver_now
  assert ActionMailer::Base.deliveries.empty?
  assert_nil email
```
