class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :bean

  validates :comment, presence: true, length: { maximum: 20 }
end
