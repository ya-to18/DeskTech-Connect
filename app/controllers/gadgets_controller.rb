class GadgetsController < ApplicationController
  def show
    @gadget = Gadget.find(params[:id])
  end
end
