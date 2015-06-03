class Favourite < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :article, dependent: :destroy
end
