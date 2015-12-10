class GraphsController < ApplicationController
  before_action :set_graph, only: [:show, :edit, :update, :destroy]

  # GET /graphs
  # GET /graphs.json
  def index
    @projects = Project.all
    @works = Work.all
    @users = User.all
  end

  def project_data
    respond_to do |format|
      puts "format ++++  #{ format }"
      puts " projects count : #{Project.all.to_json}"
      format.json {
        render :json => Project.all.to_json#{name: 'project 1', name: 'project 2'} #@projects #[1,2,3,4,5]
      }
    end
  end

  def user_data
    respond_to do |format|
      format.json{
        render :json => User.all.to_json
      }
    end
  end

  def work_data
    respond_to do |format|
      format.json{
        render :json => Work.all.to_json
      }
    end
  end

  def get_projects_json
    json_str = ""
    @projects.each do |project|
      json_str += project.to_json
      puts json_str
    end
    return json_str
  end

 end