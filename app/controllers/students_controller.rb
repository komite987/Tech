class StudentsController < ApplicationController
  before_action :find_student, except: [:new, :create, :index]
  skip_before_action :require_student, only: [:new, :create]
  before_action :require_same_student, only: [:edit, :update]
  before_action :already_logged_in, only: [:new, :create]


  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      session[:student_id] = @student.id
      flash[:success] = "Welcome #{@student.name}"
      redirect_to @student
    else
      render 'new'
    end
  end

  def index
    @students = Student.all
  end

  def show
  end

  def edit
  end

  def update
    if @student.update(student_params)
      flash[:success] = "Update completed successfully"
      redirect_to @student
    else
      render 'edit'
    end
  end

private
  def student_params
    params.require(:student).permit(:name, :email, :password, :password_confirmation)
  end

  def find_student
    @student = Student.find(params[:id])
  end

end
