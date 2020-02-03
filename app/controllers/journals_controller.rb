class JournalsController < ApplicationController
    before_action :set_journal, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    def index
        if user_signed_in?
            @journals = current_user.journals.all
            @journal = Journal.new
        else
            redirect_to "welcome/home"
        end
    end

    def show
        if user_signed_in?
            set_journal
            if @journal.entries.any?
                @entries = @journal.entries.all 
            else
                @entries = []
            end
            @entry =  @journal.entries.new
        else
            redirect_to "welcome/home"
        end
    end

    def new
        @journal = Journal.new
    end

    def create
        @journal = current_user.journals.build(journal_params)
        #@journal.user = current_user
        if @journal.save
            redirect_to journal_path(@journal) 
        else
            render 'index'
        end
    end

    def edit
        set_journal
    end

    def update
        if user_signed_in?
            set_journal
                if @journal.update(journal_params)
                    redirect_to @journal
                 else
                    render :edit
                end 
        else
            redirect_to "welcome/home"
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
