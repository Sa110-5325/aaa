class HomesController < ApplicationController

  layout 'index', except: [:about]

  def top
  end

  def about
  end
end
