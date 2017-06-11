class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.not_finished.includes(:tasks).includes(:users)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @page_name = "Ediquê - #{@project.name}"
    @tasks = @project.tasks
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_url, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #GET /projects/:project_id/report
  def get_report
    @tasks = Project.find(params[:project_id]).tasks
    render("report")
  end

  # POST /projects/:project_id/addMember/:uid
  def addMember

    @project = Project.find(params[:project_id])
    user_member = User.find(params[:uid])


    if user_member.projects.exists?(@project) 
      user_member.projects.delete(@project)
    else
      user_member.projects << @project
    end

    redirect_to controller: 'tasks', action: 'index'
  end

  def finish_project
    project = Project.find(params[:project_id])
    project.finished = true

    respond_to do |format|
      if project.save
        format.html { redirect_to projects_url, notice: 'Projeto arquivado com sucesso.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, :start_date, :final_date)
    end
end
