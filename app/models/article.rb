class Article < ActiveRecord::Base

  # include ArticleValidations

  # validates :title, uniqueness: { scope: user_id }

  has_many :favourites
  has_many :users, through: :favourites

  def self.create(title, author, description, current_user)
    Article.create(
               user_id: current_user.id,
               title:   title,
               author:  author,
               description: description
    )
  end

end