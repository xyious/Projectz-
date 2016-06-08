class ProjectsController < ApplicationController
  before_action :logged_in_user, only: [:list, :edit, :update, :destroy, :new, :create]

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if (@project.save)
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if (@project.update_attributes(project_params))
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end

  def delete
    if (Project.find(params[:id]).destroy)
      redirect_to :action => 'list'
    else
      flash.error "couldn't delete project #{project.name}"
    end
  end

  def list
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  private

    def project_params
      params.require(:project).permit(:name, :description, :deadline, :customer)
    end


    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
