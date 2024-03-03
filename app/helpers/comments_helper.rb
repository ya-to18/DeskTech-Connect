module CommentsHelper
  def my_comment?(comment_user_id)
    current_user.id == comment_user_id
  end
end
