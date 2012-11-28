class ArticlesController < ApplicationController
  def index
    @articles = Article.order('published_at DESC').page(params[:page]).per(params[:per_page] || 10)
  end

  def show
    @article = Article.find(params[:id])
  end
end
