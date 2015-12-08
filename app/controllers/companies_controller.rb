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
end
