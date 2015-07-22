class PostsController < ApplicationController
   before_action :find_post, only: [:show, :edit, :update, :destroy]

  def new
  	@post= Post.new
  end

  def create
  	@post = Post.new(post_params)
  end

  def show
  end

  private

  def post_params
  	params.require(:post).permit(:title, :content, :image)
  end

  def find_post
  	@post = Post.find(params[:user_id])
  end

end
