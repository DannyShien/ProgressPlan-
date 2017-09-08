class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end
  
  def create 
    @post = current_user.post.build post_params 
    if @post.save
      redirect_back fallback_location: goals_path, flash: {success: 'post created'}
    else
      redirect_to root_path, flash: {error: @post.errors.full_messages.to_sentence }
    end
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
