class MembersController < ApplicationController
  
  before_action :authenticate_user!
  before_action :find_idea
  
  def create
    @member = @idea.members.new
    @member.user = current_user
    if @idea.user != current_user
      @member.save
      redirect_to @idea, notice: "You just joined '#{@idea.title}'"
    else
      redirect_to root_path, alert: "Can't join your own project."
    end
  end

  def destroy
    @member = current_user.members.find(params[:id])
    if @member.destroy
      redirect_to root_path, notice: "You just left '#{@idea.title}'"
    end
  end

  private

  def find_idea
    @idea = Idea.find params[:idea_id]
  end

end
