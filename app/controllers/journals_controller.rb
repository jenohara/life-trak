class JournalsController < ApplicationController
    before_action :set_journal, only: [:show, :edit, :update, :destroy]

    def index
        @journals = current_user.journals.all
        @journal = Journal.new
    end

    def show
        if @journal.entries.any?
            @entries = @journal.entries.all 
        else
            @entries = []
        end
        @entry =  @journal.entries.new
    end

    def new
        @journal = Journal.new
    end

    def create
        @journal = current_user.journals.build(journal_params)
        if @journal.save 
            redirect_to journal_path(@journal) 
        else
            render :index
        end
    end

    def edit
    end

    def update
        if @journal.update(journal_params)
            redirect_to @journal
            else
            render :edit
        end 
    end

    def destroy
        @journal.destroy
        redirect_to journals_path
    end

    private

    def set_journal
        @journal = Journal.find_by(id: params[:id])
    end 

    def journal_params
        params.require(:journal).permit(:title, :description)
    end
end
