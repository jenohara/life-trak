class EntriesController < ApplicationController

    def index
        @journal = User.journals.find(id = params[:id])
        @entries = @journal.all
    end

    def show
        @entry = .find_by(id: params[:id])
    end

    def new
        @entry = Entry.new
    end

    def create
        @entry = Journal.entries.build(entry_params)
        if @entry.save
            redirect_to entry_path
        else
            render 'journal/show'
        end
    end

    def edit
    end

    def destroy
    end

    private
    def entry_params
        params.require(:entry).permit(:date, :content)
    end

end
