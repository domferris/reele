class CommentsController < ApplicationController

  def new
    @project = Project.find(params[:project_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @project = Project.find(params[:project_id])
    @comment.project = @project
    @comment.user = current_user
    if @comment.save
      redirect_to project_path(@project)
    else
      render 'projects/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.delete
    redirect_to project_path(@comment.project)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
