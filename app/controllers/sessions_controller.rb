class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]

  def new
    if(logged_in?)
      redirect_to projects_path
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if(user && user.authenticate(params[:session][:password]))
      log_in user
      redirect_to projects_path
    else
      # flash.now[:danger] = 'Invalid email/password combination'
      render 'new', notice: 'Invalid email/password combination'
    end
  end

  def on_denied
    render 'access_denied'
  end

  def destroy
    log_out
    if(logged_in?)
      redirect_to projects_path
    else
      render 'new'
    end
  end

end
