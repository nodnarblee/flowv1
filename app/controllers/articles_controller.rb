class ArticlesController < ApplicationController

  def destroy
    article_id = params[:id]
    article = current_user.articles.find_by(article_id)
    article.destroy

    #render nothing, just jquery remove that row.
    render nothing: true
  end

end