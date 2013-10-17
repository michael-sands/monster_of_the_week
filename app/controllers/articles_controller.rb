class ArticlesController < ApplicationController
  before_action :signed_in_user, only: [ :new, :create, :edit ]
  before_action :correct_user, only: [ :destroy ]
  
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end
  
  def show
    @article = Article.find(params[:id])
  end
    
  def new
    @article = Article.new
  end

  def create
    if !current_user.admin_user
      redirect_to root_url
    end
    @article = current_user.articles.build(article_params)
    if @article.save 
      flash[:success] = "Article created"
      redirect_to articles_path
    end   
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    if !current_user.admin_user
      redirect_to articles_path
    end
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      flash[:success] = "Article saved"
      redirect_to articles_path
    else 
      render 'edit'
    end 
  end
  
  def destroy
    @article.destroy
    redirect_to articles_path
  end
  
  private
  
    def article_params
      params.require(:article).permit(:title, :body, :user)
    end
end
