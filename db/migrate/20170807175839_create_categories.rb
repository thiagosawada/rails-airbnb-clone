class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :category
      t.text :decription
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
