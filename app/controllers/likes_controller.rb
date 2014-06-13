class LikesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_idea

  def create
    @like = @idea.likes.new
    @like.user = current_user
    if @idea.user != current_user
      @like.save
      redirect_to root_path, notice: "You just liked '#{@idea.title}'"
    else
      redirect_to root_path, alert: "Can't like your own project."
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    if @like.destroy
      redirect_to root_path, notice: "You unliked '#{@idea.title}'"
    end
  end


  private

  def find_idea
    @idea = Idea.find params[:idea_id]
  end

end
