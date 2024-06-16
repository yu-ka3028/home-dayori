class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create] #ログインせず開けるページ

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)  # ユーザーをログインさせる
      redirect_to profile_user_path(@user)
    else
      render :new
    end
  end

  def profile
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
