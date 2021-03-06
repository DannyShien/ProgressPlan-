class HomeController < ApplicationController
  before_action :require_login
  
  def index
    @goals = Goal.order("created_at DESC")
    @posts = Post.all
    @completed_goals = current_user.completed_tasks_and_goals
    @incomplete_goals = current_user.incomplete_goals

    @completed_tasks = current_user.completed_tasks
    @incomplete_tasks = current_user.incomplete_tasks


  end
end
