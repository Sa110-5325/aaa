class BeansController < ApplicationController

  def index
    @beans = Bean.all.page(params[:page]).per(6).order(" created_at DESC")
  end

  def show
    # @user = User.find_by(params[:user_id, :bean_id])
    @bean = Bean.find(params[:id])
    @comment = Comment.new
    gon.bean = @bean
  end

  def edit
    @bean = Bean.find(params[:id])
  end

  def new
    @bean = Bean.new
  end

  def create
    @bean = Bean.new(bean_params)
    @bean.user_id = current_user.id
    if @bean.save
      redirect_to beans_path(@bean)
    else
      render "new"
    end
  end

  def update
    @bean = Bean.find(params[:id])
    if @bean.update(bean_params)
      redirect_to bean_path(@bean)
    else
      render "edit"
    end
  end

  def destroy
    bean = Bean.find(params[:id])
    if bean.destroy
      redirect_to beans_path
    end
  end

  private
  def bean_params
    params.require(:bean).permit(:name, :price, :info, :image, :rate, :refresh, :bitter, :body, :fruity, :acidity)
  end

end

