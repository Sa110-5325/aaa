class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :follow, class_name: 'User'
  has_one :activity, as: :subject, dependent: :destroy

  validates :user_id, presence: true
  validates :follow_id, presence: true

  # #「フォロー」された時にactivities（未読）のレコードも同時に作成
  # after_create_commit :create_activities

  # private

  # def create_activities
  #   Activity.create!(subject: self, user: follower, action_type: :followed_me)
  # end
end
