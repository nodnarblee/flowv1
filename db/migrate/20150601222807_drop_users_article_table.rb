class DropUsersArticleTable < ActiveRecord::Migration
  def change
    drop_table :articles_users
  end
end
