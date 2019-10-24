class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :show, :update, :destroy]

  def index
    @articles = Article.all.order('created_at DESC')
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "You have successfully created a new article"
      redirect_to root_path
    else
      render 'new'
    end

  end

  def show

  end

  def edit
    
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:success] = "You have been successfully deleted an article"
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
  
  def set_article
    @article = Article.find(params[:id])
  end

end
