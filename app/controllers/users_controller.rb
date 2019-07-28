class UsersController < ApplicationController
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user # see sessions_helper/log_in
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  private 
    # define which params of User are allowed
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
    end

end
