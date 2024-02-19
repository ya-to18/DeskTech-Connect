module UsersHelper
  def logged_in_for_x?
    current_user.x_id.present?
  end

  def request_path(request_path)
    case request_path
    when posts_users_path then
      '投稿がありません。'
    when likes_users_path then
      'いいねした投稿がありません。'
    end
  end
end
