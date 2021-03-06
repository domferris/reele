class ProjectsController < ApplicationController
  before_action :find_project, only: [ :show, :edit, :update, :destroy ]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @projects = Project.all
  end

  def show
    @user = @project.user
    @published_projects = @user.projects.select { |p| p.published == true }
    @comment = Comment.new
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if params[:file]
      obj = Cloudinary::Uploader.upload(params[:file], {:resource_type => "video"})
      @project.video_url = obj['secure_url']
    end
    if @project.save
      redirect_to dashboard_path
    else
      render :new
    end

  end

  def edit; end

  def update
    @project.update(project_params)
    redirect_to dashboard_path
  end

  def destroy
    @project.destroy
    redirect_to dashboard_path
  end

  private

  def project_params
    params.require(:project).permit(:title,
                                    :description,
                                    :media_type,
                                    :published,
                                    :audio_file,
                                    :video_url, :audio_url,
                                    :tag_list, :video_id,
                                    :file,
                                    :view_count,
                                    :likes,
                                    :photo)
  end

  def find_project
    @project = Project.find(params[:id])
  end

end
