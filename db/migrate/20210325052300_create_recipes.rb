class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string     :name,       null: false
      t.text       :chach_copy, null: false
      t.text       :point,      null: false
      t.text       :upbringing, null: false
      t.integer    :many,       null: false
      t.integer    :price,      null: false
      t.references :user,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
