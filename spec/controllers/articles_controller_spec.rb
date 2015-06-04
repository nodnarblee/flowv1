require 'rails_helper'

RSpec.describe ArticlesController, :type => :controller do

  describe 'DELETE destroy' do

    let(:user) { FactoryGirl.create(:user) }
    let!(:article) { FactoryGirl.create(:article) }
    let!(:favourite) { FactoryGirl.create(:favourite, article_id: article.id, user_id: user.id) }

    before do
      user.confirm!
      sign_in user
    end

    it "deletes the article" do
      expect do
        delete :destroy, {:id => article.to_param}
      end.to change(Article,:count).by(-1)
    end

    it "deletes the article and favourite record" do
      expect do
        delete :destroy, {:id => article.to_param}
      end.to change(Favourite,:count).by(-1)
    end

  end
end
