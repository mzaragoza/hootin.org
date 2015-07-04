class Users::RegistrationsController < Devise::RegistrationsController
  layout :choose_layout
  def choose_layout
    if params[:action] == 'edit' or params[:action] =='update' or params[:action] =='change_password'
      'users/default'
    else
      'application'
    end
  end

  def after_inactive_sign_up_path_for(resource)
    users_root_path
  end

  def after_sign_up_fails_path_for(resource)
    new_user_registration_path
  end

  def after_sign_up_path_for(resource)
    session[:just_registered] = true
    sign_in(resource)
    users_root_path
  end

  private
  def sign_up_params
    allow = [:first_name, :last_name, :phone, :email, :password, :password_confirmation, ]
    params.require(resource_name).permit(allow)
  end

  def after_update_path_for(resource)
    users_root_path(resource)
  end

end
