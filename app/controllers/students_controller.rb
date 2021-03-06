class StudentsController < ApplicationController
    before_action :set_student, only: [:show,:edit,:update]
    before_action :require_same_student, only: [:edit,:update]
    before_action :not_tutor, only: [:new,:create]

    def new
        @student = Student.new
    end

    def create
        # render plain: params[:student].inspect
        @student = Student.new(student_params)
        @student.user = current_user

        if params[:student][:image]
          current_user.image = params[:student][:image]
          current_user.save
        end
        if @student.save
          flash[:success] = "Bạn đã trở thành học sinh và bạn được tặng 6 000 000 VNĐ vào tài khoản bpoint"
          @student.user.bpoint = 6000000
          @student.user.save
          redirect_to student_path(@student)
        else
          render 'new'
        end
    end

    def index

    end

    def show

    end

    def edit

    end

    def update
        if params[:student][:image]
          current_user.image = params[:student][:image]
          current_user.save
        end

        if @student.update(student_params)
            flash[:notice] = "student was successfully updated"
            redirect_to student_path(@student)
        else
            render 'edit'
        end

    end

    private

      def student_params
          params.require(:student).permit(:address, :grade)
      end

      def set_student
        @student = Student.find(params[:id])
        @user = User.find(@student.user_id)
      end

      def not_tutor
        require_user
        if current_tutor
          flash[:notice] = "Bạn không thể đăng ký làm học sinh khi bạn là gia sư"
          redirect_to root_path
        end
      end

      def require_same_student
        if current_student != @student
          flash[:notice] = "Bạn không có quyền sửa đổi thông tin này"
          redirect_to root_path
        end
      end


end
