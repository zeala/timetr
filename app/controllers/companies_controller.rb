class CompaniesController < ApplicationController
    def index
        @hello = 'Hello :)'
        @companies = Company.all

    end

    def show
        @company = Company.find(params[:id])
    end
end
