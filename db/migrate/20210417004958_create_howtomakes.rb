class CreateHowtomakes < ActiveRecord::Migration[6.0]
  def change
    create_table :howtomakes do |t|
      t.text       :text,   null: false
      t.string     :image,  null: false
      t.references :recipe, null: false, foreign_key: true
      t.timestamps
    end
  end
end
