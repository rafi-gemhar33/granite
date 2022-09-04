class Task < ApplicationRecord
  MAX_TITLE_LENGTH = 125
  validates :title, presence: true, lenght: { maximum: MAX_TITLE_LENGTH }
end