class LikesController < ApplicationController
  def toggle
    if params[:goal_id]
      @item = Goal.find(params[:goal_id])
      current_user.toggle_like!(@item)
    elsif params[:task_id]
      @item = Task.find params[:task_id]
      current_user.toggle_like!(@item)
    end 
    
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }     
      format.js
    end
  end
end
