class FavouritesController < ApplicationController

  def favourite_article
    title = params[:title].gsub("\n", ' ').squeeze(' ')
    author = params[:author].gsub("\n", ' ').squeeze(' ')
    description = params[:description].gsub("\n", ' ').squeeze(' ')
    article_link = params[:article_link].gsub("\n", ' ').squeeze(' ')
    author_link = params[:author_link].gsub("\n", ' ').squeeze(' ')
    source = params[:source]

    @article = current_user.articles.create(title: title,
                                            author: author,
                                            description: description,
                                            article_link: article_link,
                                            author_link: author_link,
                                            source: source)

    if @article.save
      flash.now[:notice] = 'Nice, your article has been saved!'
    end

    render nothing: true
  end

end