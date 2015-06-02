class AddLinksToArticlesTable < ActiveRecord::Migration
  def change
    add_column :articles, :author_link, :string
    add_column :articles, :article_link, :string
  end
end
