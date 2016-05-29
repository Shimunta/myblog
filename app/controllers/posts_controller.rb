class PostsController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = find_id
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "Post was saved!"
      redirect_to @post
    else
      flash.now[:alert] = "There was an error saving"
      render :new
    end
  end
  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
  def find_id
    Post.new(params[:id])
  end
end
