class Article < ActiveRecord::Base

  # Validations
  has_many :favourites, dependent: :destroy
  has_many :users, through: :favourites

  before_create :scrub_fields_of_new_lines


  # this is method is for scrubbing the strings that are returned from the scraper as
  # there it usually contains /n and empty space that we do not need for the purposes
  # of this application.
  private
  def scrub_fields_of_new_lines
    [:title, :author, :description, :article_link, :author_link, :source].each do |col|
      self[col] = self[col].gsub("\n", ' ').squeeze(' ') unless self[col].nil?
    end
  end

end
