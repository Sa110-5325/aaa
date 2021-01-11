class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  has_many :shops, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :username, presence: true
  
  def already_faverited?(shop)
    self.favorites.exists?(shop_id: shop.id)
  end

end
