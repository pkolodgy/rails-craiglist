class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @article = Article.new
  end

  def create
    @category = Category.find(params[:category_id])
    @article = @category.articles.build(article_params)
    @article.user = current_user

    if @article.save
      redirect_to category_article_url(@category, @article)
    else
      render "new"
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update_attributes(article_params)
      redirect_to category_article_url(@article.category, @article)
    else
      render "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_url
  end

private
  def article_params
    params.require(:article).permit(:title, :price, :description)
  end

end
