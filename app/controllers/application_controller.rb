class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  # Config for username authen
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me, :image, :phone, :birthday,
                    :gender, :name]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

# Helper method
  helper_method :require_user, :current_tutor, :require_tutor,
                :current_student, :require_student,
                :all_students, :all_tutors, :messages,
                :locations


  def require_user
      if !current_user
        flash[:notice] = "Bạn phải đăng nhập để thực hiện điều này"
        redirect_to root_path
      end
  end

  def current_tutor
    if user_signed_in?
      current_user.tutor
    end
  end

  def require_tutor
    if !current_tutor
      flash[:notice] = "Bạn cần phải là giáo viên"
      redirect_to root_path
    end
  end

  def current_student
    if user_signed_in?
      current_user.student
    end
  end

  def require_student
    if !current_student
      flash[:notice] = "Bạn cần phải là học sinh"
      redirect_to root_path
    end
  end

  def all_students
    Student.all
  end

  def all_tutors
    Tutor.all
  end

  def messages
    if current_user
      Message.where(:user_id => current_user.id)
    end
  end

  def locations

  end

end
