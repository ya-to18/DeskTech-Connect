class GadgetsController < ApplicationController
  def show
    @gadget = Gadget.find(params[:id])
  end

  def ranking
    @gadgets = Gadget.joins(:posts).joins(:genre).select('gadgets.*, COUNT(posts.id)').group('gadgets.id').order('COUNT(posts.id) DESC').limit(10)

    @gadgets = @gadgets.where(genres: { id: params[:genre_id] }) if params[:genre_id].present?
  end
end
