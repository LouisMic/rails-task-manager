class TasksController < ApplicationController
  before_action :find_task, only: [:show]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(params_task)
    redirect_to tasks_path
  end

  private

  def params_task
    params.require(:task).permit(:title, :details, :completed)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
