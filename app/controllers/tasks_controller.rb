class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_filter :load_project

  # GET /tasks
  # GET /tasks.json
  def index
    @users = User.all
    @tasks = @project.tasks.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @users = User.all
    @task = @project.tasks.find(params[:id])
  end

  # GET /tasks/new
  def new
    @task = @project.tasks.new
  end

  # GET /tasks/1/edit
  def edit
    @task = @project.tasks.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = @project.tasks.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to [@project, @task], notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to [@project, @task], notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = @project.tasks.find(params[:id])
    @task.destroy
   # respond_to do |format|
   #   format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
   #   format.json { head :no_content }
   # end
  end

  # POST /:project_id/:task_id/addMemberTask/:uid
  def addMemberTask
    @task = @project.tasks.find(params[:task_id])
    user_member = User.find(params[:uid])


    if user_member.tasks.exists?(@task) 
      user_member.tasks.delete(@task)
    else
      user_member.tasks << @task
    end

   # redirect_to controller: 'tasks', action: 'show'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :description, :final_date, :task_report)
    end

    def load_project
      @project = Project.find(params[:project_id])
    end
end
