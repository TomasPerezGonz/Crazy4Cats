class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  
  def index
    @articles = Article.order(:created_at).page(params[:page]).per(10)
  end
  
  def show
    @comment = Comment.new
    @comments = @article.comments
  end
  
  def new
    @article = current_user.articles.build
  end
  
  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to @article, notice: 'El articulo fue creado exitosamente.'
    else
      render :new
    end
  end
  
  private
  
  def set_article
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title, :description)
  end
end

  