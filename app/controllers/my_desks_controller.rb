class MyDesksController < ApplicationController
  before_action :set_my_desk, only: %i[show edit update destroy]
  def index
    @my_desks = current_user.my_desks
  end

  def show
    @gadgets = @my_desk.gadgets
  end

  def new
    @my_desk = MyDesk.new
  end

  def edit
  end

  def create
    @my_desk = current_user.my_desks.new(my_desk_params)
    respond_to do |format|
      if @my_desk.save
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @my_desk.update(my_desk_params)
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @my_desk.destroy!
    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def set_my_desk
    @my_desk = MyDesk.find(params[:id])
  end

  def my_desk_params
    params.require(:my_desk).permit(:name, :user_id)
  end
end
