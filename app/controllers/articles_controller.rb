class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @articles = Article.all.order("Created_at DESC")
  end

  def show
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(articles_params)

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
