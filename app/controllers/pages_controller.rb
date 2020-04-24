class PagesController < ApplicationController
    before_action :require_student, only: [:favourite_tutor,:favourite_destroy]

    def home
      Gon.global.locations = Location.select(:city).distinct
      Gon.global.locations_district = Location.select(:district,:city_id,:district_id).distinct
      Gon.global.locations_sub_district = Location.select(:id,:sub_district,:district_id)
      Gon.global.subjects = Subject.all
    end

    def bpoint_page

    end

    def show
        @temp_array = []
        @temp_hash = {}
        @class_register = nil
        @user = User.find(params[:id])
        if @user.messages.any?
          @messages = @user.messages
          if current_tutor
            @messages.each do |message|
              @temp_array << Student.find(message.student_id)
            end
            # Merge to array into hash
            @messages.each_with_index {|item,index| @temp_hash[item] = @temp_array[index]}
          elsif current_student
            @messages.each do |message|
              @temp_array << Tutor.find(message.tutor_id)
            end
            # Merge to array into hash
            @messages.each_with_index {|item,index| @temp_hash[item] = @temp_array[index]}
          end

        end

        if current_student
          @class_registers =  current_student.class_registers
        end

        if current_tutor
          @class_registers = current_tutor.class_registers
        end
    end

    def favourite_tutor
      @tutor = Tutor.find(params[:tutor_id])
      id = params[:id]
      current_student.tutors << @tutor
      current_student.save
      flash[:notice] = "Đã lưu gia sư vào danh sách yêu thích"
      redirect_to root_path
    end

    def favourite_destroy
      @tutor = Tutor.find(params[:id])
      current_student.tutors.destroy(@tutor)
      flash[:notice] = "Đã xóa gia sư khỏi danh sách yêu thích"
      redirect_to root_path
    end

end
