module UsersHelper
  def logged_in_for_x?
    current_user.x_id.present?
  end
end
