module ApplicationHelper
  
  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    return true if session[:user_id] != nil
  end

  def require_login
    unless logged_in?
      flash[:danger] = "You must be logged in to access this section!"
      redirect_to login_path
    end
  end


  def display_sender_name(sender_id)
    User.find(sender_id).name
  end

  def date_of_next_saturday
    date  = Date.parse('Saturday')
    delta = date > Date.today ? 0 : 7
    date + delta
  end


end
