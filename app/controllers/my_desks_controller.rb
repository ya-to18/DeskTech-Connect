class MyDesksController < ApplicationController
  def index
    @my_desk = current_user.my_desks
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
