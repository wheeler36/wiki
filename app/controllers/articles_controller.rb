class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :destroy]

  def index
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(articles_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def articles_params
    params.require(:article).permit(:title, :content)
  end
end
