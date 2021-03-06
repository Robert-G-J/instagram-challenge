class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new( post_params )
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:body, :image)
  end

end
