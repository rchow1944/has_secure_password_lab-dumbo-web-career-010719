class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]
  #code
  def new
    @user = User.new
  end

  def create
    #code
    if user_params[:password] == user_params[:password_confirmation]
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  def home
    #code
    render "/application/home"
  end

  private

  def require_login
    #code
    redirect_to '/login' unless session.include? :user_id
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
