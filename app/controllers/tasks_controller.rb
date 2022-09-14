class TasksController < ApplicationController
  before_action :set_user, only: [:index, :show, :new, :edit, :update]
  before_action :set_task, only: [:edit]
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :index]
  before_action :admin_or_correct_user, only: :update


  def index
    @tasks = @user.tasks.where(user_id: @user.id).order(created_at: :desc)
  end

  def show
    @user = User.find(params[:user_id])
    @task = Task.find(params[:id])
  render :show
  end

  def new
    @task = Task.new
  end
  
  def create
    @task = @user.tasks.build(task_params)
    if @task.save
      flash[:success] = "タスクを新規作成しました。"
      redirect_to user_tasks_url @user
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    if @task.update_attributes(task_params)
      flash[:success] = "タスクを更新しました。"
      redirect_to user_task_url(@user, @task)
    else
      render :edit
    end
  end
  
  def destroy
    @task.destroy
    flash[:success] = "タスクを削除しました。"
    redirect_to user_tasks_url @user
  end
  
  private

    def task_params
      params.require(:task).permit(:name, :description)
    end
    
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_task
      unless @task = @user.tasks.find_by(id: params[:id])
        flash[:danger] = "権限がありません。"
        redirect_to user_tasks_path @user
      end
    end
end


  # private
  #   def set_user
  #     @user = User.find(params[:user_id])
  #   end
    
  #   def set_task
  #     @task = @user.tasks.find_by(id: params[:id])
  #     unless @task == current_user?(@user)
  #       flash[:danger] = "権限がありません。"
  #       redirect_to user_tasks_path @user
  #     end
  #   end
    
  #   def task_params
  #     params.require(:task).permit(:task_name, :task_description)
  #   end
