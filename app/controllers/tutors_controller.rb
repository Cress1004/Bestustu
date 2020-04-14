class TutorsController < ApplicationController
  before_action :set_tutor, only: [:show, :edit, :update]
  before_action :require_same_tutor, only: [:edit,:update]
  before_action :not_student, only: [:new]

  def new
    @tutor = Tutor.new
    @user = @users.find(current_user.id)
  end

  def create
    @tutor = Tutor.new(tutor_params)
    @tutor.user_id = current_user.id
    @user.image.url = "/uploads/user/image/avt_define/avt_male.png"
    if @tutor.save
      flash[:success] = "Bạn đã trở thành gia sư và bạn được tặng 1 000 000 VNĐ vào tài khoản bpoint"
      @tutor.user.bpoint = 1000000
      @tutor.user.save
      redirect_to tutor_path(@tutor)
    else
      render 'new'
    end
  end

  def index
    # debugger
    @users = User.all
    @Locations = Location.all

    if (params[:tutor]) and (params[:tutor][:location_id] or params[:tutor][:subject_id])
      @tutors = Tutor.search(params[:tutor][:location_id],params[:tutor][:subject_id]).page(params[:page]).per(3)
    elsif params[:search_input]
      @tutors = Tutor.search_by_location_name(params[:search_input]).page(params[:page]).per(3)

      if @tutors.size == 0
        @tutors = Tutor.search_by_subject_name(params[:search_input]).page(params[:page]).per(3)
      end
    else
      @tutors = Tutor.all.page(params[:page]).per(3)
    end

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
    @location = Location.find(@tutor.location_id)
  end

  def tutor_params
    params.require(:tutor).permit(:job, :description, :achievement, :location_id, :work_place,times_free_ids:[])
  end

  def not_student
    require_user
    if current_student
      flash[:notice] = "Bạn không thể đăng ký làm gia sư khi bạn là học sinh"
      redirect_to root_path
    end
  end

  def require_same_tutor
    if current_tutor != @tutor
        redirect_to root_path
    end
  end

end
