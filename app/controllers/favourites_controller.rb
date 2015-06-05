class FavouritesController < ApplicationController

  respond_to :json, :html

  def favourite_article

    article = current_user.articles.create(title: params[:title],
                                           author: params[:author],
                                           description: params[:description],
                                           article_link: params[:article_link],
                                           author_link: params[:author_link],
                                           source: params[:source])

    if article.persisted?
      head :ok
    else
      render json: { errors: article.errors.full_messages }, status: 406
    end
  end

end


