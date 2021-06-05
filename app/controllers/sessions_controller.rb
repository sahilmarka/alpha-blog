class SessionsController < ApplicationController
    def new
    end 

    def create
        user = User.find_by(username:params[:session][:username])
        if(user && user.authenticate(params[:session][:password]))
        flash[:notice] = "logged in successfully" 
        session[:user_id] = user.id
        redirect_to user 
        else 
        flash.now[:alert] = "please enter correct creadentials" 
        render 'new' 
        end

    end

    def destroy 
        session[:user_id] = nil
        flash[:notice] = "Logged Out Successfully !"
        redirect_to root_path
    end
end