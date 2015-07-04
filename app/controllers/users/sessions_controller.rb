class Users::SessionsController < Devise::SessionsController
  layout 'application'
  private
  def after_sign_in_path_for(resource)
    if resource.is_admin
      users_dashboard_path
    else
      users_consumers_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end



