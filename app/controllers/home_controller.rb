class HomeController < ApplicationController
  before_action :require_login

  def index
    @goal = Post.order("update_at DESC")
  end
end
