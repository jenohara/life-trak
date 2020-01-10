class SessionsController < ApplicationController

    def new
        @user = User.new
        render 'welcome/login' 
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else
            flash[:error] = "Sorry, your username or password was incorrect"
            render 'welcome/login'
        end
    end

    def home
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end
end
