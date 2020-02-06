class EntriesController < ApplicationController

    def index
      if user_signed_in?  
        @journal = Journal.find_by(id: params[:journal_id])
            if @journal.entries.any?
                @entries = @journal.entries.order(date: :desc)
            else
                @entries = []
            end
        else
            redirect_to "welcome/home"
        end
    end

    def new
        if user_signed_in? 
            if params[:journal_id] && @journal = Journal.find_by(id: params[:journal_id]) 
            @entry = @journal.entries.build  
            @new_mood = Mood.new  
            else
                @entry = Entry.new 
            end
        else
            redirect_to "welcome/home"
        end
    end

    def create
        if user_signed_in? 
            @journal = Journal.find_by(id: params[:journal_id])
            @entry = @journal.entries.build(entry_params) 
            @entry.user = current_user
            if @entry.save 
                redirect_to journal_path(@entry.journal_id)
            else
                render :new
            end
        else
            redirect_to "welcome/home"
        end
    end

    def show
        if user_signed_in? 
            set_entry
            redirect_to journal_entry_path(@entry)
        else
            redirect_to "welcome/home"
        end
    end

    def edit
        if user_signed_in?
            set_entry
        else
            redirect_to "welcome/home"
        end
    end

    def update
        if user_signed_in?
            set_entry
            @entry.update(entry_params)
            redirect_to journal_path(@entry.journal), notice: "Entry Successfully Updated"
        else
            redirect_to "welcome/home"
        end
    end

    def destroy 
        if user_signed_in?
            set_entry
            @entry.destroy 
            redirect_to journal_path(@entry.journal)
        else
            redirect_to "welcome/home"
        end
    end

    private

    def set_journal
        @journal = Journal.find_by(id: params[:journal_id])
    end

    def set_entry
        @entry = current_user.entries.find(params[:id])
        #@entry = @journal.entries.find_by(id: params[:id])
    end

    def entry_params
        params.require(:entry).permit(:date, :content, :journal_id, :user_id, :mood_ids =>[])
    end
end
