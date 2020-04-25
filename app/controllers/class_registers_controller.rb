class ClassRegistersController < ApplicationController
  before_action :set_class_register, only: [:edit,:update,:show,:register,:select_tutors,:destroy]
  before_action :require_student, only: [:new,:create,:edit,:update,:select_tutors,:destroy]
  before_action :require_same_student, only: [:edit,:update,:select_tutors,:destroy]
  before_action :require_tutor, only: [:register]

  # khi tao lop moi. neu user chua la hs thi redirect to new user
  def new
    @class_register = ClassRegister.new
  end

  def create
    @class_register = ClassRegister.new(class_register_params)
    @class_register.student = current_student
    if current_user.bpoint >= (current_student.class_registers.size + 1)* 100000
      if @class_register.save
        flash[:success] = "Đã đăng yêu cầu"
        redirect_to class_register_path(@class_register)
      else
        flash[:danger] = "Lỗi trong quá trình tạo lớp"
        render :new
      end
    else
      flash[:notice] = "Bạn không có đủ tiền để tạo lớp học"
      redirect_to class_registers_path
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

  def register

    if current_tutor
      if @class_register.tutors.include? current_tutor
        flash[:danger] = "Bạn đã đăng ký lớp học này rồi"
        redirect_to class_register_path(@class_register)
      elsif @class_register.tutors.count < 6
        if current_tutor.user.bpoint >= (current_tutor.class_registers.size + 1)*200000
          @class_register.tutors << current_tutor
          @class_register.save
          flash[:success] = "Đăng ký thành công"
          redirect_to class_register_path(@class_register)
        else
          flash[:notice] = "Bạn không đủ bpoint để đăng ký lớp"
          redirect_to class_register_path(@class_register)
        end
      else
        flash[:danger] = "Số lượng request tối đa là 6"
        redirect_to class_register_path(@class_register)
      end
    else
      flash[:danger] = "Bạn không phải là gia sư"
      redirect_to class_register_path(@class_register)
    end

  end

  def select_tutors

  end

  def tutor_selected
    @tutor = Tutor.find(params[:id])
    @class_register = ClassRegister.find(params[:class_id])

    # Message for tutor after be selected
    @message_tu = Message.new
    # debugger
    @message_tu.user = @tutor.user
    @message_tu.message_content = "Nhận lớp: \"" + @class_register.description.to_s + "\", môn học: "+ @class_register.subject.name.to_s + ". Bạn đã bị trừ 200000VNĐ trong tài khoản bpoint"
    # To specify student id to trace back for student
    @message_tu.student_id = @class_register.student.id

    if @message_tu.save
      flash[:success] = "Successfully send message to tutor"
      # Sub 200000VND from bpoint account
      @tutor.user.bpoint = @tutor.user.bpoint - 200000
      @tutor.user.save
    else
      flash[:danger] = "Cannot send email to tutor"
      redirect_to class_register_path(@class_register)
    end

    #Message for student after select tutor
    @message_stu = Message.new
    @message_stu.user = @class_register.student.user
    @message_stu.message_content = "Lớp \"" + @class_register.description.to_s + "\" của bạn đã được gia sư nhận thành công" + ", bạn đã bị trừ 100 000VNĐ từ tài khoản bpoint, liên hệ gia sư: " + @tutor.user.name.to_s + ", SDT: " + @tutor.user.phone
    # To specify tutor id to trace back for tutor
    @message_stu.tutor_id = @tutor.id

    if @message_stu.save
      flash[:success] = "Successfully send message to student"
      # Sub 100000VND from bpoint account
      @class_register.student.user.bpoint = @class_register.student.user.bpoint - 100000
      @class_register.student.user.save
    else
      flash[:danger] = "Cannot send email to student"
      redirect_to class_register_path(@class_register)
    end
    #After send message to student and tutor destroy the class
    @class_register.destroy

    redirect_to show_user_info_path(current_user.id)
  end

  def destroy
    @class_register.destroy
    redirect_to class_registers_path
  end

  def index
    if params[:class_register] and (params[:class_register][:location_name] or params[:class_register][:subject_id])
      @class_registers = ClassRegister.search(params[:class_register][:location_name],params[:class_register][:subject_id]).page(params[:page]).per(3)
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
