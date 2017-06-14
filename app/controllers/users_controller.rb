class UsersController < ApplicationController

  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render '/signup'
    end

  end
  def show

  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :age, :sex, :religion, :ethnicity, :income, :password)
  end
end
