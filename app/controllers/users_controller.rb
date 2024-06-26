class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, status: 200
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json:  @user, status: 200
    else
      render json: { error: @user.errors.full_messages.join(', ') }
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password ,:password_confirmation)
  end
end
