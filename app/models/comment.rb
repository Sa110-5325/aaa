class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :bean
  has_many :notifications, dependent: :destroy
  has_one :activity, as: :subject, dependent: :destroy

  validates :comment, presence: true, length: { maximum: 20 }
  
  # #「いいね」された時にactivities（未読）のレコードも同時に作成(コールバック)
  # after_create_commit :create_activities
  
  # private
  
  # def create_activities
  #   Activity.create!(subject: self, user: bean.user, action_type: :commented_to_own_bean)
  # end
end
