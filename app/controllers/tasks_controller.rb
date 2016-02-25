class TasksController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
  	# @tasks = Task.all
  	@finished_tasks = Task.finished
  	@unstarted_tasks = Task.not_started
    @started_tasks = Task.started

    @task = Task.all

  end

  def new
  	 @tasks = Task.new

  end

  def create
    @tasks = Task.new(task_params)
    # debugger
    respond_to do |format|
      if @tasks.save
        flash[:success] = "Your new task has been created."
        format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
        format.json { render :index, status: :created, location: @tasks }
      else
        flash.now[:error] = "Your task was not created."
        format.html { render :new }
        format.json { render json: @tasks.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  	 @task = Task.find(params[:id])
	   @task.update_attribute(:status, params[:status].to_i)	 
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end


  private
	  def task_params
	    params.require(:task).permit(:title, :description)
	  end

end
