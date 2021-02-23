class Bean < ApplicationRecord
  belongs_to :user
  attachment :image, content_type: ["image/jpeg", "image/png", "image/gif"]
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, presence: true
  validates :rate, presence: true
  validates :price, presence: true
  validates :info, presence: true, length: { maximum: 100 }
  validates :image, presence: true
  validates :refresh, inclusion: { in: [1,2,3,4,5] }
  validates :bitter, inclusion: { in: [1,2,3,4,5] }
  validates :body, inclusion: { in: [1,2,3,4,5] }
  validates :fruity, inclusion: { in: [1,2,3,4,5] }
  validates :acidity, inclusion: { in: [1,2,3,4,5] }


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
