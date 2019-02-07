class SessionsController < ApplicationController
  #code
  def new
    #code
  end

  def create
    #code
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end
end
