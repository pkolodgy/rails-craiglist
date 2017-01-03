class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.decimal :price, null: false
      t.string :title, null: false
      t.text :description
      t.references :user

      t.timestamps
    end
  end
end
