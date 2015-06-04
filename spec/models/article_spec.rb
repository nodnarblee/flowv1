require 'rails_helper'

RSpec.describe Article, :type => :model do

  describe 'Associations' do
    it { is_expected.to have_many :favourites }
    it { is_expected.to have_many(:users).through(:favourites) }
  end

end