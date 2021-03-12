class Activity < ApplicationRecord
  # belongs_to :subject, polymorphic: true
  # enum read: {
  #   unread: false,
  #   read: true,
  # }

  # def transition_path
  #   case action_type.to_sym
  #   when :commented_to_own_bean
  #     bean_path(subject.bean, anchor: "js-comment-#{subject.id}")
  #   when :favorited_to_own_bean
  #     bean_path(subject.bean)
  #   when :followed_me
  #     user_path(subject.follower)
  #   end
  # end
end
