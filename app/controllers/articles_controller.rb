class ArticlesController < ApplicationController
    before_action :set_article, only: [:show,:edit,:update,:destroy]

    def show
    end

    def index
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end

    def new 
        @article = Article.new
    end
 
    def create
        @article = Article.new(white_list_article)
        @article.user_id = create_user.id
        if @article.save
        flash[:notice] = 'article created successfully'
        redirect_to @article
        else
        render 'new'
        end
    end 

    def edit
    end

    def update 
        if @article.update(white_list_article)
            flash[:notice] = 'article updated successfully'
            redirect_to @article
        else 
        render 'edit' 
        end
    end

    def destroy
        @article.destroy
        flash[:notice] = 'article deleted successfully'
        redirect_to @article   
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def white_list_article
        params.require(:article).permit(:title,:description)
    end
        
end
