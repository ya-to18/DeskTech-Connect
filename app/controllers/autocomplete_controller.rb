class AutocompleteController < ApplicationController
  def brand
    @gadgets = Gadget.where("brand like ?", "%#{params[:q]}%")
    respond_to do |format|
      format.js
    end
  end

  def name
    @gadgets = Gadget.where("name like ?", "%#{params[:q]}%")
    respond_to do |format|
      format.js
    end
  end
end
