class PostsController < ApplicationController
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

  private

  def post_params
    params.require(:post).permit(:radio_name, :content)
  end
end