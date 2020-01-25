class MoodsController < ApplicationController

    def index
        @moods = Mood.all
    end

    def new
        @mood = Mood.new
    end

    def create
        @mood = Mood.new(mood_params)
        if @mood.save
            redirect_to :index 
        else
            render :index
        end
    end

    def edit
    end

    def create
    end

    private

    def mood_params
        params.require(:mood).permit(:mood_type)
    end
end
