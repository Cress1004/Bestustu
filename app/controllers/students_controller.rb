class StudentsController < ApplicationController
    def new
        @student = Student.new
    end

    def create
        # render plain: params[:student].inspect
        @student = Student.new(student_params)
        @student.user = current_user
        if @student.save
          flash[:success] = "You are a student"
          redirect_to student_path(@student)
        else
          render 'new'
        end
    end
    def show
        @student = Student.find(params[:id])
    end

    def edit
        @student = Student.find(params[:id])
    end

    def update
        @student = Student.find(params[:id])
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
end
