module SessionsHelper
  def log_in(user)
    if(session)
      session[:user_id] = user.id
    else
      #this enables login in during capybara tests
      @current_session_user = User.find_by(id: session[:user_id])
    end
  end
  def log_out
    @current_session_user = nil
    session.delete(:user_id)
  end

  def current_user
    @current_session_user ||= User.find_by(id: session[:user_id])
  end
  def logged_in?
    session[:user_id] != nil && current_user != nil
  end

  def is_admin_session
    return logged_in? && current_user.admin?
  end

  def authenticate_admin
    if !is_admin_session
      redirect_to denied_path
    end
  end

  def authenticate_user
    if !logged_in?
      redirect_to login_path
    end
  end
end
