class CompaniesController < ApplicationController
    def index
        @companies = Company.all

    end

    def show
        @company = Company.find(params[:id])
        respond_to do |format|
            format.html # show html file
            format.xml {render xml: @company }
            format.json { render json: @company}
        end
    end

  def new
      @company = Company.new
  end

  def create
    @company = Company.new(params[:company].permit(:name))
    if @company.save
      flash[:notice] = "Company entry created"
      redirect_to @company
    else
      render 'new'
      flash[:alert] = "Entered incorrect details"
    end
  end

  def edit
    @company = Company.find(params[:id])
  end
end
