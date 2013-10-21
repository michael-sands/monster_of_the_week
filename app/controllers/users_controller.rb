class UsersController < ApplicationController
  before_action :signed_in_user, only: [ :index, :edit, :update, :destroy ]
  before_action :correct_user,   only: [ :edit, :update ]
  before_action :admin_user,     only: :destroy
  
  def new
    if self.signed_in? then
      redirect_to root_url
    end
    
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end  
  
  def create
    if self.signed_in? then
      redirect_to root_url
      return
    end
    
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Monster of the Week website!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    if !self.signed_in?
      redirect_to root_url
      return
    end
    @user = User.find(params[:id])
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def index
    # list users
  end
  
  def destroy
    user_to_destroy = User.find(params[:id])
    if current_user?(user_to_destroy) then
      flash.now[:error] = "Self-destruction not permitted."
    else
      user_to_destroy.destroy
      flash[:success] = "User destroyed."
    end
    redirect_to users_url
  end
  
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
