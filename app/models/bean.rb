class Bean < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :name, presence: true
  validates :price, presence: true
  validates :info, presence: true
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
