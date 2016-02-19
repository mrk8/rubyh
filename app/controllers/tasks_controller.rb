class TasksController < ApplicationController
  def index
  	# @tasks = Task.all
  	@finished_tasks = Task.where(status: Task::Status::FINISHED)
  	@unfinished_tasks = Task.where(status: [Task::Status::NOT_STARTED, Task::Status::STARTED])

  end

  def new
  	 @tasks = Task.new
  end

  def create
    @tasks = Task.new(task_params)
    # debugger
    respond_to do |format|
      if @tasks.save
        format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
        format.json { render :index, status: :created, location: @tasks }
      else
        format.html { render :new }
        format.json { render json: @tasks.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

  	 @task = Task.find(params[:id])
	   @task.status = 2 
     @task.save
     redirect_to tasks_path
	 
  end


  private
	  def task_params
	    params.require(:task).permit(:title, :description)
	  end

end
