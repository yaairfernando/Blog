class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(params[:comment].permit(:comment))
    flash[:success] = "You have been successfully created a new comment"
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    flash[:negative] = "You have been successfully deleted a comment"
    redirect_to article_path(@article)
  end

end
