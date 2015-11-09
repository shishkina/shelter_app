class CommentsController < ApplicationController
  def create
    @comment = Comment.new comment_params
    @comment.animal_id = params[:animal_id]
    @comment.user_id = current_user.id
    @comment.save
    redirect_to animal_path @comment.animal
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to animal_path
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to animal_path
  end
  private
  def comment_params
    params.require(:comment).permit(:body, :animal_id, :user_id)
  end
end
