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
#@task = @project.tasks.find(params[:id])
    @project = Project.find(params[:project_id])

    respond_to do |format|
      format.html
      format.json { render :json => { :task => @task, :location => [@project, @task] }, :include => {:users => {:only => :id}} }
    end
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
    members_array = params[:task][:list_members]

    update_task_members(members_array)

    respond_to do |format|
      if @task.save
        format.html { redirect_to [@project], notice: 'Atividade criada com sucesso' }
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

    members_array = params[:task][:list_members]

    update_task_members(members_array)

    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to [@project], notice: 'Atividade atualizada com sucesso' }
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

  # POST /:project_id/:task_id/add_member_to_task/:uid
  def add_member_to_task
    @task = @project.tasks.find(params[:task_id])
    add_member(params[:uid], @task)

    redirect_to [@project]
  end

  def add_member(member_id, task)
    user_member = User.find(member_id)


    if user_member.tasks.exists?(task) 
      user_member.tasks.delete(task)
    else
      user_member.tasks << task
    end
  end

  def update_task_members(members_id)
    @task.users.delete(@task.users)
    if members_id
      members_id.each do |member_id|
        member = User.find(member_id)
        if !member.tasks.exists?(@task)
          add_member(member_id, @task)
        end
      end
    end
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
