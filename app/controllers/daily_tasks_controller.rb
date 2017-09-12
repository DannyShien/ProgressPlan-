class DailyTasksController < ApplicationController
  def index
    @task = Task.all
  end

  def new
    @task = Task.new
  end

  def create 
    @task = current_user.tasks.build task_params
    if @task.save
      flash[:success] = "Task Set."
    else
      flash[:error] = @task.error.full_message.to_sentence
    end
    redirect_to root_path
  end

  def complete
    @task = Task.find(params[:id])
    @task.completed = DateTime.now
    if @task.save
      flash[:sucess] = "Completed"
    else
      flash[:error] = @task.errors.full_message.to_sentence
    end
    redirect_to root_path
  end

  def task_params
    params.require(:task).permit(:title)
  end

end
