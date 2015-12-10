class WorksController < ApplicationController

  def index
      if (params[:days])
          @works = Work.recentdays(params[:days]).order('datetimeperformed desc')
      else
          @works = Work.all.order('datetimeperformed desc')
      end
  end

  def show
      @work = Work.find(params[:id])
  end

  def new
      @work = Work.new
  end

  def edit
    @work = Work.find(params[:id])
  end

  def create
    @work = Work.new(params[:work].permit(:project_id, :user_id, :datetimeperformed, :hours))
    respond_to do |format|
      if @work.save
        format.html{ redirect_to @work, notice: "Work created" }
        format.js {}
      else
        format.html {render 'new'}
        format.js {}
      end
     end
  end

  def update
    @work = Work.find([params[:id]])
    if @work.update
      flash[:notice] = "Work updated"
      redirect_to @work
    else
      redirect_to 'edit'
    end
  end
end
