class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin, only: [:new, :edit, :create, :destroy]

  # GET /users
  # GET /users.json
  def index
    @page_name = "Ediquê - Usuários"
    @users = User.order('first_name ASC, last_name ASC')
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @page_name = "Ediquê - #{@user.full_name}"
    @current_projects = @user.projects.not_finished
    @past_projects = @user.projects.finished
  end

  # GET /users/new
  def new
    @page_name = "Ediquê - Criar usuário"
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.create(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:cpf, :first_name, :last_name, :admin, :email, :password, :password_confirmation)
    end
end
