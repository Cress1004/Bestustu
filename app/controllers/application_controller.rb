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
  helper_method :current_tutor, :require_tutor,
                :current_student, :require_student
  def current_tutor
    current_user.tutor
  end

  def require_tutor
    if !current_user.tutor
      redirect_to root_path
    end
  end

  def current_student
    current_user.student
  end

  def require_student
    if !current_user.student
      redirect_to root_path
    end
  end

end
