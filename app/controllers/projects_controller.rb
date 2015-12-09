class ProjectsController < ApplicationController
    def index
        @projects = Project.all
    end

    def show
        if (params[:slug])
            @project = Project.find_by(slug: params[:slug])
        else
            @project = Project.find(params[:id])
        end
    end

    def new
        @project = Project.new
    end

    def create
      @project = Project.new(params[:project].permit(:name, :company_id, :slug, :default_rate))
      @project.save
      flash[:notice] = "New project entry is created"
      redirect_to @project
    end
end
