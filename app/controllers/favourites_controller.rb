class FavouritesController < ApplicationController

  def favourite_article
    title = params[:title].gsub("\n", ' ').squeeze(' ')
    author = params[:author].gsub("\n", ' ').squeeze(' ')
    description = params[:description].gsub("\n", ' ').squeeze(' ')
    article_link = params[:article_link].gsub("\n", ' ').squeeze(' ')
    author_link = params[:author_link].gsub("\n", ' ').squeeze(' ')

    @article = current_user.articles.create(title: title, author: author, description: description)

    if @article.save
      flash.now[:notice] = 'Nice, your article has been saved!'
    end
    # render template: "pages/home", status: 200
    # redirect_to {controller: :pages, action: :home}
    render nothing: true
  end

end