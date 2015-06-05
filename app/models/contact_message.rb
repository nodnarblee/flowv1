class ContactMessage < ActiveRecord::Base

  # Validations
  validates :name, :email, :message, presence: true
  validates :message, length: { minimum: 10 }
  validates :email,
            format:      { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }

end