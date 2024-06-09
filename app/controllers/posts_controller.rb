class PostsController < ApplicationController
  skip_before_action :require_login, only: [:index, :show, :new, :vote] #ログインせず開けるページ

  def index
    @posts = Post.all  # 全ての投稿を取得
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path # 保存が成功した場合、indexページにリダイレクト
    else
      flash.now[:error] = '入力が不足しています' # 保存が失敗した場合、新規投稿ページ(topページ)を再表示
      render 'posts/new'
    end
  end

  def vote
    @post = Post.find(params[:id])
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

    redirect_to post_path(@post)
  end
  
  def show
    @post = Post.find(params[:id])
  end

private

  def post_params
    params.require(:post).permit(:radio_name, :content)
  end
end
