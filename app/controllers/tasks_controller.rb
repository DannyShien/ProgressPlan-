class TasksController < ApplicationController
  

  def index
    @task = Task.all
  end

  def new
    @task = Task.new
  end

  def show
  end

  def create 
    @task = Task.new task_params
    if @task.save
      flash[:success] = "Task set."
    else
      flash[:error] = @task.errors.full_messages.to_sentence
    end
    redirect_back fallback_location: root_path
  end

  def complete
    @task = Task.find(params[:id])
    if @task.toggle!
      flash[:success] = "Completed"
    else
      flash[:error] = @task.errors.full_messages.to_sentence
    end
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js 
    end
  end

  def task_params
    params.require(:task).permit(:title, :goal_id)
  end
end
