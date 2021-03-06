class Bean < ApplicationRecord
  belongs_to :user
  attachment :image, content_type: ["image/jpeg", "image/png", "image/gif"]
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :name, presence: true
  validates :rate, presence: true
  validates :price, presence: true
  validates :info, presence: true, length: { maximum: 100 }
  validates :refresh, inclusion: { in: [1,2,3,4,5] }
  validates :bitter, inclusion: { in: [1,2,3,4,5] }
  validates :body, inclusion: { in: [1,2,3,4,5] }
  validates :fruity, inclusion: { in: [1,2,3,4,5] }
  validates :acidity, inclusion: { in: [1,2,3,4,5] }


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def create_notification_favorite!(current_user)
    # いいねボタンを連打した時に一回しか通知がいかないような悪用防止
    temp = Notification.where(["visitor_id = ? and visited_id = ? and bean_id = ? and action = ?", current_user.id, user_id, id, 'favorite'])
    # いいねされてない時飲み通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        bean_id: id,
        visited_id: user_id,
        action: 'favorite'
        )
        # 自分の投稿に対するいいねの時は通知済とする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  def create_notification_comment!(current_user, comment_id)
    #自分以外にコメントしている人を全て取得して、全員に通知を送る
    temp_ids = Comment.select(:user_id).where(bean_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    #まだ誰もコメントしてない時、投稿者に通知を送る
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    #コメントは一人が複数投稿するため一つの投稿に複数通知する
    notification = current_user.active_notifications.new(
      bean_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    #自分の投稿に対するコメントだった時は通知済とする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
