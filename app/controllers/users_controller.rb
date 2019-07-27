class UsersController < ApplicationController
  
  def create
    @user = User.new(user_params)
    if @user.save
      # Handle a successful save.
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
