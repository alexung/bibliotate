class EnrollmentsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @enrollment = Enrollment.new
    @courses = Course.all
  end

  def destroy
    Enrollment.destroy(params[:id])
    # Notification.destroy(noteable_type:"enrollment", noteable_id:params[:id])
    # notifications destroyed with dependent: :destroy in model
    redirect_to '/'
  end

  def create
    @courses = Course.all
    @enrollment = Enrollment.new(enrollment_params)
    @enrollment.user_id = current_user.id
    @enrollment.course_id = Course.find_by(name: params[:enrollment][:course]).id
    @enrollment.save
    Notification.create(noteable_id: @enrollment.id, noteable_type: "enrollment", user_id: @enrollment.course.user_id)
    redirect_to '/'
  end

  private

  def enrollment_params
    params.require(:enrollment).permit([:user_id, :course_id])
  end

end

#<Notification id: nil, status: true, noteable_id: nil, noteable_type: nil, user_id: nil, created_at: nil, updated_at: nil>
