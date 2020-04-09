class TutorsController < ApplicationController
  before_action :set_tutor, only: [:show, :edit, :update]

  def new
    @tutor = Tutor.new
  end

  def create
    @tutor = Tutor.new(tutor_params)
    @tutor.user_id = current_user.id
    if @tutor.save
      flash[:success] = "You are a tutor"
      redirect_to tutor_path(@tutor)
    else
      render 'new'
    end
  end

  def index
    @users = User.all
    @Locations = Location.all
    if (params[:tutor]) and (params[:tutor][:location_id])
      @tutors = Tutor.search_by_location(params[:tutor][:location_id]).page(params[:page]).per(3)
    else
      @tutors = Tutor.all.page(params[:page]).per(3)
    end
  end

  # def index
  #    @tutors = Tutor.all.page(params[:page]).per(5)
  #    @users = User.all
  #    @Locations = Location.all
  #  end

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
    @location = Location.find(@tutor.location_id)
  end

  def tutor_params
    params.require(:tutor).permit(:job, :description, :achievement, :location_id, :work_place,times_free_ids:[])
  end

end
