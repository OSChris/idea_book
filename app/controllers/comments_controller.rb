class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_idea

  def create
    @comment = @idea.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @idea, notice: "Comment posted!"
    else
      redirect_to @idea, alert: "Problem creating comment"
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    redirect_to @idea, notice: "Comment deleted!"
  end

  private

  def find_idea
    @idea = Idea.find params[:idea_id]
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
