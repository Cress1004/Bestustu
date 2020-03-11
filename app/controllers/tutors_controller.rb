class TutorsController < ApplicationController
  before_action :set_tutor, only: [:show, :edit, :update]

  def index
    @tutors = Tutor.all
    @users = User.all
  end

  def edit
  end

  def update
    if @tutor.update(tutor_params)
      flash[:success] = "Tutor infomation was sucessfully update"
      redirect_to tutor_path(@tutor)
    else
      render 'edit'
    end
  end

  def show
  end

  private

  def set_tutor
    @tutor = Tutor.find(params[:id])
    @user = User.find(@tutor.user_id)
  end

  def tutor_params
    params.require(:tutor).permit(:job, :description, :achievement, :location_id)
  end

end
