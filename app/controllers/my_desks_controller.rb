class MyDesksController < ApplicationController
  before_action :set_my_desk, only: %i[show edit update destroy add_gadget remove_gadget]
  before_action :set_gadget, only: %i[add_gadget remove_gadget]

  def index
    @my_desks = current_user.my_desks
    @default_my_desk = current_user.my_desks.first
    @default_my_desk_gadgets = current_user.my_desks.first.gadgets
  end

  def show
    @gadgets = @my_desk.gadgets.order(created_at: :desc)
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

  def add_gadget
    respond_to do |format|
      format.turbo_stream do
        if @my_desk.my_desk_gadgets.find_by(gadget_id: @gadget.id).present?
          flash.now[:error] = t('.registered', my_desk_name: @my_desk.name)
        elsif @my_desk.gadgets << @gadget
          flash.now[:success] = t('.new_register', my_desk_name: @my_desk.name)
        else
          flash.now[:error] = t('.fail')
        end
        render turbo_stream: turbo_stream.prepend('flash_messages', partial: 'shared/flash_message', locals: flash)
      end
    end
  end

  def remove_gadget
    my_desk_gadget = @my_desk.my_desk_gadgets.find_by(gadget_id: @gadget)

    return unless my_desk_gadget.destroy!

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def set_my_desk
    @my_desk = MyDesk.find(params[:id])
  end

  def set_gadget
    @gadget = Gadget.find(params[:gadget_id])
  end

  def my_desk_params
    params.require(:my_desk).permit(:name, :user_id)
  end
end
