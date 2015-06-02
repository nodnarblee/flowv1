module ArticleValidations

  def existing_article(title)
    articles = current_user.articles
    if articles.find_by(title: title).present?
    errors.add(:base, 'It appears have already favourited this article')
    end
  end

end