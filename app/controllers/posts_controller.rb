class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :vote]
  before_action :check_user, only: [:edit, :update, :destroy] 
  skip_before_action :require_login, only: [:index, :show, :create, :new, :vote] #ログインせず開けるページ

  def index
    @posts = Post.all  # 全ての投稿を取得
  end

  def new
    @post = Post.new
  end

  def create
    if logged_in?
      @post = current_user.posts.build(post_params) # ログインしているユーザーの投稿を作成
    else
      @post = Post.new(post_params) # ログインしていないユーザーも投稿を作成できる
    end
  
    if @post.save
      redirect_to posts_path # 保存が成功した場合、indexページにリダイレクト
    else
      flash.now[:error] = '入力が不足しています' # 保存が失敗した場合、新規投稿ページ(topページ)を再表示
      render 'posts/new'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: 'Post was successfully deleted.'
  end

  def vote
    @post = Post.find(params[:id])
  
    if logged_in? # ログインしている場合
      if @post.votes.where(user_id: current_user.id).exists?
        # すでに投票済みの場合
        flash[:alert] = 'You have already voted for this post.'
      else
        # まだ投票していない場合
        @post.votes.create(user_id: current_user.id)
        flash[:notice] = 'Your vote was recorded.'
      end
    else # ログインしていない場合
      voted_posts = cookies[:voted_posts] ? JSON.parse(cookies[:voted_posts]) : []
  
      if voted_posts.include?(@post.id.to_s)
        # すでに投票済みの場合
        flash[:alert] = 'You have already voted for this post.'
      else
        # まだ投票していない場合
        @post.votes.create
        voted_posts << @post.id.to_s
        cookies[:voted_posts] = { value: JSON.generate(voted_posts), expires: 1.day.from_now }
        flash[:notice] = 'Your vote was recorded.'
      end
    end
  
    redirect_to post_path(@post)
  end
  
  def show
    @post = Post.find(params[:id])
  end

  private

  def set_post
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to posts_path, alert: "The post you were looking for could not be found."
  end
  
  def check_user
    if @post.user_id != current_user&.id
      Rails.logger.debug "Current user is not the owner of the post."
      redirect_to root_path, alert: "You are not authorized to perform this action."
    else
      Rails.logger.debug "Current user is the owner of the post."
    end
  end
  def post_params
    params.require(:post).permit(:radio_name, :content)
  end
end
