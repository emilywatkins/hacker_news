class CommentsController < ApplicationController
  def new
    @link = Link.find(params[:link_id])
    @comment = @link.comments.new
  end

  def create
    @link = Link.find(params[:link_id])
    @comment = @link.comments.new(comment_params)
    if @comment.save
      redirect_to link_path(@comment.link)
    else
      render :new
    end
  end

  def edit
    @link = Link.find(params[:link_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to link_comment_path
    else
      render :edit
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to link_comment_path
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
