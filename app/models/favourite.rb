class Favourite < ActiveRecord::Base

  # Relations
  belongs_to :user
  belongs_to :article

  # Validations
  validates :article_id, uniqueness: { scope: :user_id }

end
