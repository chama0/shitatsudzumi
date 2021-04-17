class CreateHowtomakes < ActiveRecord::Migration[6.0]
  def change
    create_table :howtomakes do |t|

      t.timestamps
    end
  end
end
