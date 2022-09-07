# frozen_string_literal: true

class Comment < ApplicationRecord
  MAX_CONTENT_LENGTH = 511

  belongs_to :user
  belongs_to :task

  validates :content, presence: true, length: { maximum: MAX_CONTENT_LENGTH }
end
