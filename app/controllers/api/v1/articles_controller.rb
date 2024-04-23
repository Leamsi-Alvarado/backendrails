class Api::V1::ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render json: @articles , status: 200
  end

  def show
    @article = Article.find_by(id: params[:id])
    if @article
      render json: @article, status: 200
    else
      render json: {
        error: "Article not found"
      }
    end
  end

  def create
    @article = Article.new(
      title: arti_params[:title],
      body: arti_params[:body],
      author: arti_params[:author]
    )
    if @article.save
      render json: @article, status: 200
    else
      render json: {
        error: "Error creating..."
      }
    end
  end

  def update
    @article = Article.find_by(id: params[:id])
    if @article
      @article.update(
        title: arti_params[:title],
        body: arti_params[:body],
        author: arti_params[:author]
      )
      render json: @article, status: 200
    else
      render json: {
        error: "Error creating..."
      }
    end
  end

  def destroy
    @article = Article.find_by(id: params[:id])
    if @article
      @article.destroy
      render json: "Article has been deleted"
    else
      render json: "Unable to destroy"
    end
  end


  private def arti_params
    params.require(:article).permit([
      :title,
      :body,
      :author
                                    ])
  end
end
