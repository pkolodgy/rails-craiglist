class AddCategoryToArticle < ActiveRecord::Migration[5.0]
  def change
    add_reference :articles, :category
  end
end
