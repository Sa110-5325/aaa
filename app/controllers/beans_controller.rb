class BeansController < ApplicationController
  def index
    @beans = Bean.all
  end

  def show
    @bean = Bean.find(params[:id])
    @comment = Comment.new
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
    end
  end

  def update
    if @bean = Bean.find(params[:id])
      @bean.update(bean_params)
      redirect_to beans_path
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
    params.require(:bean).permit(:name, :price, :info, :image)
  end

end

