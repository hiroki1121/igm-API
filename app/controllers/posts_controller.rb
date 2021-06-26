class PostsController < ApplicationController
  protect_from_forgery except: :create

  def index
    @posts = Post.order('created_at ASC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end
  
  def show
    @post = Post.find(params[:id])
    result = @post.image_check
  end

  private
  def post_params
    params.require(:post).permit(:image)
  end
end
