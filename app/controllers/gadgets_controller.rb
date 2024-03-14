class GadgetsController < ApplicationController
  def show
    @gadget = Gadget.find(params[:id])
  end

  def ranking
    if params[:genre_id]
      @gadgets = Gadget.joins(:posts).joins(:genre)
      .select('gadgets.*, COUNT(posts.id) AS posts_count')
      .where(genres: {id: params[:genre_id]})
      .group('gadgets.id')
      .order('posts_count DESC')
      .limit(10)

    else
      @gadgets = Gadget.joins(:posts).joins(:genre)
      .select('gadgets.*, COUNT(posts.id) AS posts_count')
      .group('gadgets.id')
      .order('posts_count DESC')
      .limit(10)
    end
  end
end
