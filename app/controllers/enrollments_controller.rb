class EnrollmentsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @enrollment = Enrollment.new
    @courses = Course.all
  end

  def create
    @courses = Course.all
    @enrollment = Enrollment.new(enrollment_params)
    @enrollment.user_id = current_user.id
    @enrollment.course_id = Course.find_by(name: params[:enrollment][:course]).id
    @enrollment.save
    redirect_to '/'
  end

  private

  def enrollment_params
    params.require(:enrollment).permit([:user_id, :course_id])
  end

end
