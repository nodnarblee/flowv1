class Article < ActiveRecord::Base

  has_many :favourites, dependent: :destroy
  has_many :users, through: :favourites

  before_create :scrub_fields_of_new_lines

  private
  def scrub_fields_of_new_lines
    [:title, :author, :description, :article_link, :author_link, :source].each do |col|
      self[col] = self[col].gsub("\n", ' ').squeeze(' ')
    end
  end

end
