module SessionsHelper
  def log_in(user)
    puts("\n\n#{user}\n\n\n")
    session[:user_id] = user.id
  end
  def log_out
    @current_session_user = nil
    session.delete(:user_id)
  end

  def current_user
    @current_session_user ||= User.find_by(id: session[:user_id])
  end
  def logged_in?
    session[:user_id] != nil
  end


  def authenticate_user
    if !logged_in?
      redirect_to login_path
    end
  end
end
