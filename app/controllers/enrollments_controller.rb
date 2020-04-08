class EnrollmentsController < ApplicationController

  def create
    adding_course = Course.find(params[:course_id])
    unless current_student.courses.include?(adding_course)
      Enrollment.create(student_id: current_student.id, course_id: adding_course.id)
      flash[:success] = "You have successfully enroll #{adding_course.name}"
      redirect_to current_student
    else
      flash[:warning] = "Something was wrong with enrollment"
      redirect_to root_path
    end
  end
end
