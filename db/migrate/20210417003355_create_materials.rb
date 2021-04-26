class CreateMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :materials do |t|
      t.string     :material_name,  null: false
      t.string     :quantity,       null: false
      t.integer    :material_price, null: false
      t.references :recipe,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
