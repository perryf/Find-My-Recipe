class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :name, null: false
      t.string :type
      t.references :recipe, index: true, foreign_key: true
    end
  end
end
