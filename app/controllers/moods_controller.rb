class MoodsController < ApplicationController

    def index
        if user_signed_in? 
            @moods = Mood.all
            @mood = Mood.new
        else
            redirect_to "welcome/home"
        end
    end

    def show
        if user_signed_in? 
            @mood = Mood.find_by(id: params[:id])
            @entries = @mood.entries.where(user: current_user).order(date: :desc)
        else
            redirect_to "welcome/home"
        end
    end

    def new
        if user_signed_in? 
            @mood = Mood.new
        else
            redirect_to "welcome/home"
        end
    end

    def create
        if user_signed_in? 
            @mood = Mood.new(mood_params)
            if @mood.save
                redirect_to moods_path 
            else
                render 'index'
            end
        else
            redirect_to "welcome/home"
        end
    end

   def destroy
    if user_signed_in? 
        @mood = Mood.find_by(id: params[:id])
        @mood.destroy
        redirect_to moods_path
    else
        redirect_to "welcome/home"
    end
   end

    private

    def mood_params
        params.require(:mood).permit(:mood_type)
    end
end
