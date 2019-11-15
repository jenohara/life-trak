class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def new
    end

    def create
        @user = User.new
        @user[:username] = params[:user][:username]
        @user[:email] = params[:user][:email]
        @user[:password] = params[:user][:password]
        @user.save
        redirect_to user_path(@user)
    end
end

