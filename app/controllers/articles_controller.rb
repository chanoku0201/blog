class ArticlesController < ApplicationController
  before_action :common_params, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.order("created_at DESC")
  end
  
  def show
    
  end

  def new
    @article = Article.new
  end

  def edit
   
  end

  def create
    # render plain: params[:article].inspect
    # raise params.inspect
    @article = Article.new(article_params)
    @article.save

    if @article.save
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    
    @article.destroy
    redirect_to articles_path
  end

  def article_params
    params.require(:article).permit(:title, :text)
  end 

  def common_params
    @article = Article.find params[:id]
  end

end