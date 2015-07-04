class Users::SessionsController < Devise::SessionsController
  layout 'application'
  private
  def after_sign_in_path_for(resource)
    users_dashboard_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end



