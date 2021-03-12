class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :bean
  has_one :activity, as: :subject, dependent: :destroy
  
  # #「いいね」された時にactivities（未読）のレコードも同時に作成
  # after_create_commit :create_activities
  
  # private
  
  # def create_activities
  #   Activity.create!(subject: self, user: bean.user, action_type: :favorited_to_own_bean)
  # end
end