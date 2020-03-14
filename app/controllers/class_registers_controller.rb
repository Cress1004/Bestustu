class ClassRegistersController < ApplicationController
  before_action :set_class_register, only: [:edit,:update,:show,:destroy]

  def new
    @class_register = ClassRegister.new
  end

  def create
    @class_register = ClassRegister.new(class_register_params)
    @class_register.student = Student.first
    if @class_register.save
      redirect_to class_register_path(@class_register)
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @class_register.update(class_register_params)
      redirect_to class_register_path(@class_register)
    else
      render :edit
    end
  end

  def show

  end

  def destroy
    # set_article
    @class_register.destroy
    redirect_to class_registers_path
  end

  def index
    if params[:class_register] and (params[:class_register][:location_id] or params[:class_register][:subject_id])
      @class_registers = ClassRegister.search(params[:class_register][:location_id],
        params[:class_register][:subject_id]).page(params[:page]).per(3)
    else
      @class_registers = ClassRegister.all.page(params[:page]).per(3)
    end
  end

  private
    def class_register_params
      params.require(:class_register).permit(:description,:hours_lesson,:lessons_week,:salary,:tutor_gender,:num_student,:class_content,:location_id,:subject_id,times_free_ids:[])
    end

    def set_class_register
      @class_register = ClassRegister.find(params[:id])
    end

    def require_same_student
      if current_user.student != @class_register.student
          redirect_to root_path
      end
    end


end
