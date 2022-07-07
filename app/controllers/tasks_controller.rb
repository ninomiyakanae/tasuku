class TasksController < ApplicationController
  def index
     @user = User.find(params[:user_id])
    # @tasks = @user.tasks
     @tasks = @user.tasks.where(user_id: @user.id).order(created_at: :desc)
  end   
    
  def new
    @task = Task.new
  end
end
