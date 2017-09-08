class GoalsController < ApplicationController
  def index
    @goal = Goal.all
  end

  def new
    @goal = Goal.new
  end

  # def show
  # end

  def create
    @goal = current_user.goals.build goal_params
    if @goal.save
      flash[:success] = "Goal set."
    else
      flash[:error] = @goal.errors.full_messages.to_sentence
    end
    redirect_to root_path
  end

  def goal_params
    params.require(:goal).permit(:title)
  end
end
