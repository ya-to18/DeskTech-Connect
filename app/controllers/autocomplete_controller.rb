class AutocompleteController < ApplicationController
  def brand
    @gadgets = Gadget.select('DISTINCT brand').where('brand like ?', "%#{params[:q]}%")
    respond_to do |format|
      format.js
    end
  end

  def name
    @gadgets = Gadget.select('DISTINCT name').where('name like ?', "%#{params[:q]}%")
    respond_to do |format|
      format.js
    end
  end
end
