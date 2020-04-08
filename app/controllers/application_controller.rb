class ApplicationController < ActionController::Base

  before_action :require_student
  helper_method :current_student, :logged_in

  def current_student
    @current_student ||= Student.find(session[:student_id]) if session[:student_id]
  end

  def logged_in
    !!current_student
  end

  def require_student
    if !logged_in
      flash[:danger] = "You must be logged in to do this action"
      redirect_to login_path
    end
  end

  def already_logged_in
    if session[:student_id] != nil
    flash[:warning] = "You are already logged in "
    redirect_to root_path
  end
  end

  def require_same_student
    if current_student != @student
      flash[:danger] = "You can only edit your account"
      redirect_to student_path(current_student)
    end
  end


end
