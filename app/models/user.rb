# frozen_string_literal: true

class User < ApplicationRecord
  MAX_NAME_LENGTH = 255

  has_many :assigned_tasks, class_name: "Task", foreign_key: "assigned_user_id"

  validates :name, presnce: true, length: { maximum: MAX_NAME_LENGTH }
end
