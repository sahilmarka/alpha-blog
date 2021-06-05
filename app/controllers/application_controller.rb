class ApplicationController < ActionController::Base
helper_method :create_user,:logged_in?
    def create_user 
        @create_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    def logged_in? 
        !!create_user
    end
end
