class UsersController < ApplicationController
    before_action :set_user,only: [:create, :update, :edit, :show]
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "Welcome to the Alpha Blog #{@user.username}, you have successfully signed up"
        redirect_to articles_path
      else
        render 'new'
      end
    end

    def show 
        @articles = @user.articles.paginate(page: params[:page], per_page: 5)
    end

    def edit 
    end

    def update
        if(@user.update(user_params))
          flash[:notice] = "#{@user.username} Your credentials were updated successfully"
          redirect_to @user; #same as user_path(@user)
        else 
            render 'edit'
        end
    end

    def index 
        @users = User.paginate(page: params[:page], per_page: 5)
    end
  
    private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
    def set_user 
      @user = User.find(params[:id])
    end
  
  end 