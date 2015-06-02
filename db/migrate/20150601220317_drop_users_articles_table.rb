class DropUsersArticlesTable < ActiveRecord::Migration
  def change
    drop_table :user_articles
  end
end
