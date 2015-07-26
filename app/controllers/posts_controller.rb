class PostsController < ApplicationController
   before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
  	@posts  = Post.all.order('created_at DESC')
  end

  def new
  	@post= Post.new
  end

  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id

	if @post.save
		redirect_to @post, notice: "Successfully created your Modo story"
	else 
		render 'new'
	end
  end

  def show
  	@post = Post.find(params[:id])
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])

  	if @post.update(post_params)
  		redirect_to @post, notice: "Your story was successfully updated"
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@post.destroy
  	redirect_to root_path
  end

  private

  def require_auth
    if @post.user_id != current_user.id
      flash[:alert] = "You are not authorized to perform that action."
      redirect_to :back
    end
  end

  def post_params
  	params.require(:post).permit(:title, :content, :image)
  end

  def find_post
  	@post = Post.find(params[:id])
  end

end
