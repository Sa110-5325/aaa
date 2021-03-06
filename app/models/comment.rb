class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :bean
  has_many :notifications, dependent: :destroy

  validates :comment, presence: true, length: { maximum: 20 }
end
