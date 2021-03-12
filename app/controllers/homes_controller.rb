class HomesController < ApplicationController

  layout 'index', except: [:about]

  def top
    @rankings = Bean.find(Favorite.group(:bean_id).order('count(bean_id) DESC').limit(6).pluck(:bean_id))
  end

  def about
  end
end
