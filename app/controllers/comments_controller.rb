class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.project = @project
    @comment.user = current_user
    if @comment.save
      redirect_to project_path(@project)
    else
      render 'projects/show'
    end
  end

  def destroy
    # @comment = Comment.find(where project_id == params[:id]) ##### FIGURE OUT THIS LOGIC
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
