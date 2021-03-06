class CommentsController < ApplicationController

  def create
    @article = Article.find_by_id(params[:article_id])
    p @article
    @comment = @article.comments.create(comment_params)

    redirect_to article_path(@article)
  end

private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
