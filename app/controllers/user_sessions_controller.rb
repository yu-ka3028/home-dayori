class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      if params[:remember_me]
        @user.remember_me!
        cookies.permanent.signed[:remember_me_token] = @user.remember_me_token
      end
      redirect_to profile_user_path(@user)
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, status: :see_other
  end
end
