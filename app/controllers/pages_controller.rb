class PagesController < ApplicationController
  before_action :authenticate_user!, only: [
    :favourites
  ]

  def home
    @rf = ArticleScraper.fetch_json_for(:ruby_flow)
    @hn = ArticleScraper.fetch_json_for(:hacker_news)
    @tb = ArticleScraper.fetch_json_for(:thought_bot)
    @rd = ArticleScraper.fetch_json_for(:reddit)
    @tc = ArticleScraper.fetch_json_for(:tech_crunch)
    @rc = ArticleScraper.fetch_json_for(:ruby_corner)
  end

  def favourites
    @articles = current_user.articles
  end

end
