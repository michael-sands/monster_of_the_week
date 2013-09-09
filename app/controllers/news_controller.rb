class NewsController < ApplicationController
  before_action :signed_in_user, only: [ :create, :destroy ]
  #before_action :admin_user, only: [ :create, :destroy ]
  
  def index
    @newsitems = News.paginate(page: params[:page])
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new(news_params)
    if @news.save 
      flash[:success] = "News created"
      redirect_to root_url
    end  
  end
  
  def edit
  end
  
  def destroy
  end
  
  private
  
    def news_params
      params.require(:news).permit(:title, :body)
    end
end
