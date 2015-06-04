require 'rails_helper'

RSpec.describe User, :type => :model do

  describe 'Attributes' do
    it { is_expected.to respond_to :username }
    it { is_expected.to respond_to :email }
  end

  describe 'Validations' do

    it { should validate_uniqueness_of :username }
    it { should validate_length_of(:username).is_at_least(4).is_at_most(15) }

  end

  describe 'Associations' do
    it { is_expected.to have_many :favourites }
    it { is_expected.to have_many(:articles).through(:favourites) }
  end

end