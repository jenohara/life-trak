class MoodsController < ApplicationController

    def index
        @moods = Mood.all
        @mood = Mood.new
    end

    def show
        @mood = Mood.find_by(id: params[:id])
        @entries = @mood.entries.where(user: current_user).order(date: :desc)
    end

    def new
        @mood = Mood.new
        redirect_to "welcome/home"
    end

    def create
        @mood = Mood.new(mood_params)
        if @mood.save
            redirect_to moods_path 
        else
            render 'index'
        end
    end

   def destroy
        @mood = Mood.find_by(id: params[:id])
        @mood.destroy
        redirect_to moods_path
   end

    private

    def mood_params
        params.require(:mood).permit(:mood_type)
    end
end
