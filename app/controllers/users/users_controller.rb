class Users::UsersController < UserController
  expose(:users){ current_user }
  expose(:user, attributes: :user_params)
  def update_available_status
    current_user.update_available_status
    redirect_to users_root_path
  end
end

