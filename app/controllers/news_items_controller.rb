class NewsItemsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :get_news_item, only: [:update, :edit, :show, :destroy]
  before_action :valid_news_item_resource, only: [:edit, :destroy, :update]

  def index
    @news_items = NewsItem.all
  end

  def create
    @news_item = current_user.news_items.build(news_item_params)
    if @news_item.save
        flash[:success] = "Новость создана"
        redirect_to news_items_path
    else
        render "news_items/index"
    end
  end

  def new
    @news_item = current_user.news_items.build
  end

  def update
    if @news_item.update_attributes(news_item_params)
      flash[:success] = "Новость обновлена" 
      redirect_to action: "index"
    else
      render 'edit'
    end 
  end

  def edit
  end

  def destroy
    @news_item.destroy
    respond_to do |format|
      format.html { redirect_to news_items_path }
      format.json { head :no_content }
    end
  end

  private 

    def get_news_item
      @news_item = NewsItem.find(params[:id])
    end

    def news_item_params
        params.require(:news_item).permit(:content)
    end

    def valid_news_item_resource
      valid_resource(@news_item.user)
    end
end
