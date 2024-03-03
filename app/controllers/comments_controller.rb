class CommentsController < ApplicationController
  before_action :set_post, only: %i[new edit create update destroy]
  before_action :set_comment, only: %i[edit update destroy]

  def new
    @comment = current_user.comments.new(post_id: @post.id)
  end

  def create
    @comment = current_user.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.turbo_stream
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @comment.destroy!
    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(post_id: @post.id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
