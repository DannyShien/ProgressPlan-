class HomeController < ApplicationController
  before_action :require_login

  def index
    @goals = Goal.order("created_at DESC")
    @posts = Post.all  
  end
  
end
