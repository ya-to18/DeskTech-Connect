module MyPagesHelper
  def posted_user?
    if @latest_post.present?
      render 'posted_user'
    else
      render 'no_posted_user'
    end
  end
end
