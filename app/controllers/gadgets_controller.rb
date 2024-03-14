class GadgetsController < ApplicationController
  def show
    @gadget = Gadget.find(params[:id])
  end

  def ranking
    if params[:genre_id]
      @gadgets = Gadget.joins(:genre).where(genre: { id: params[:genre_id] })
    else
      @gadgets = Gadget.all
    end
  end
end
