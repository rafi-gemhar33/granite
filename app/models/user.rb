# frozen_string_literal: true

class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  MAX_NAME_LENGTH = 255
  MAX_EMAIL_LENGTH = 255

  has_many :assigned_tasks, class_name: "Task", foreign_key: "assigned_user_id"
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

  private

    def set_email_downcase!
      email.downcase!
    end
end
