class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
      case resource
      when Administrator
        admin_path
      when Member
        members_my_page_path
      end
    end

    def after_sign_out_path_for(resource)
      case resource
      when :administrator
        new_administrator_session_path
      when :member
        root_path
      end
    end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :street_address, :phone_number, :is_active])
  end


end
