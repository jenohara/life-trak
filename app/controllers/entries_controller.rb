class EntriesController < ApplicationController
    before_action :set_entry, only: [:show, :edit, :update, :destroy]

    def index 
        @journal = Journal.find_by(id: params[:journal_id])
            if @journal.entries.any?
                @entries = @journal.entries.order(date: :desc)
            else
                @entries = []
            end
    end

    def new
        if params[:journal_id] && @journal = Journal.find_by(id: params[:journal_id]) 
            @entry = @journal.entries.build   
        else
            @entry = Entry.new 
        end
    end

    def create
        @journal = Journal.find_by(id: params[:journal_id])
        @entry = @journal.entries.build(entry_params) 
        @entry.user = current_user
        if @entry.save 
            redirect_to journal_path(@entry.journal_id)
        else
            render :new
        end
    end

    def show
        redirect_to journal_entry_path(@entry)
    end

    def edit
    end

    def update
        @entry.update(entry_params)
        redirect_to journal_path(@entry.journal), notice: "Entry Successfully Updated"
    end

    def destroy 
        @entry.destroy 
        redirect_to journal_path(@entry.journal)
    end

    private

    # def set_journal
    #     @journal = Journal.find_by(id: params[:journal_id])
    # end

    def set_entry
        @entry = current_user.entries.find(params[:id])
        #@entry = @journal.entries.find_by(id: params[:id])
    end

    def entry_params
        params.require(:entry).permit(:date, :content, :journal_id, :user_id, :mood_ids =>[])
    end
end
