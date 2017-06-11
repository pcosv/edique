class SessionsController < ApplicationController
  include SessionsHelper
  def new
    if(current_user)
      redirect_to projects_path
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if(user && user.authenticate(params[:session][:password]))
      log_in user
      redirect_to projects_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    render 'new'
  end

end
