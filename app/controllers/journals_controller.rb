class JournalsController < ApplicationController

    def index
        @journals = Journal.all
    end

    def show
        set_journal
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
        set_journal
    end

    def update
        set_journal
        if journal.update(journal_params)
            redirect_to @journal
        else
            render :edit
        end 
    end

    def destroy
       set_journal
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
