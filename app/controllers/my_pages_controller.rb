class MyPagesController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @latest_post = current_user.posts.last
  end
end
