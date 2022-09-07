# frozen_string_literal: true

class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  MAX_NAME_LENGTH = 255
  MAX_EMAIL_LENGTH = 255

  has_many :assigned_tasks, class_name: "Task", foreign_key: "assigned_user_id"
  has_many :created_tasks, class_name: "Task", foreign_key: "task_owner_id"

  has_secure_password
  has_secure_token :authentication_token

  validates :name, presence: true, length: { maximum: MAX_NAME_LENGTH }
  validates :email, presence: true,
                    length: { maximum: MAX_EMAIL_LENGTH },
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 6 }, if: -> { password.present? }
  validates :password_confirmation, presence: true, on: :create

  before_save :set_email_downcase!

  before_destroy :assign_tasks_to_task_owners

  private

    def set_email_downcase!
      email.downcase!
    end

    def assign_tasks_to_task_owners
      tasks_whose_owner_is_not_current_user = assigned_tasks.select { |task| task.task_owner_id != id }
      tasks_whose_owner_is_not_current_user.each do |task|
        task.update(assigned_user_id: task.task_owner_id)
      end
    end
end
