class LoginsController < ApplicationController
  skip_before_action :require_student, only: [:new, :create]
  before_action :already_logged_in, only: [:new, :create]

  def new
  end

  def create
    student = Student.find_by(email: params[:logins][:email].downcase)
    if student && student.authenticate(params[:logins][:password])
      session[:student_id] = student.id
      flash[:success] = "You are successfully logged in"
      redirect_to student
    else
      flash.now[:warning] = "You have a problem with your information"
      render 'new'
    end
  end

  def destroy
    session[:student_id] = nil
    flash[:danger] = "You are successfully logged out"
    redirect_to root_path
  end

end
