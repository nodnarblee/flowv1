class FavouritesController < ApplicationController

  respond_to :json, :html

  def favourite_article
    article = current_user.articles.create(title: params[:title],
                                           author: params[:author],
                                           description: params[:description],
                                           article_link: params[:article_link],
                                           author_link: params[:author_link],
                                           source: params[:source])
    # binding.pry
    # respond_with(article)
    if article.persisted?
      head :ok
    else
      render json: { errors: article.errors.full_messages }, status: 406
    end
  end
end


# CreateFavouriteService.call( current_user, params.slice(:title, :author, etc...) )
#
# class CreateFavouriteService
#
#   # returns boolean. True if new article created.
#   def self.call( user, data_opts = {} )
#     raise 'favourite requires some data' if data_opts.blank?
#
#     article = user.articles.create(title: data_opts[:title],
#                          author: data_opts[:author],
#                          description: data_opts[:description],
#                          article_link: data_opts[:article_link],
#                          author_link: data_opts[:author_link],
#                          source: data_opts[:source])
#
#     article.persisted?
#   end
#
#   # helper methods here...
#
#
#
# end