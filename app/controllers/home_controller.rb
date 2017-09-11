class HomeController < ApplicationController
  before_action :require_login
  def index
    @goals = Goal.order("created_at DESC")
    @posts = Post.all
    @completed_goals = current_user.completed_goals
    @incomplete_goals = current_user.incomplete_goals

  end
end
