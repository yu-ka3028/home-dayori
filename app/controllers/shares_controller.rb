class SharesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    current_user.share(@post)
    redirect_to @post
  end

  def destroy
    @post = Share.find(params[:id]).post
    current_user.unshare(@post)
    redirect_to @post
  end
end
