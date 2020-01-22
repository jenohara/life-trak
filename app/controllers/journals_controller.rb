class JournalsController < ApplicationController

    def index
        @journals = Journal.all
    
    end

    def show
        @journal = Journal.find_by(id: params[:id])
    end

    def new
        @journal = Journal.new
    end

    def create
        @journal = Journal.new(journal_params)
        @journal.user = current_user
        if @journal.save
            redirect_to @journal 
        else
            render 'index'
        end
    end

    def edit
        @journal = Journal.find(params[:id])
    end

    def destroy

    end

    private

    def journal_params
        params.require(:journal).permit(:title, :description)
    end
end
