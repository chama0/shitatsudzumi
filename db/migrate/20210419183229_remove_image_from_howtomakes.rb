class RemoveImageFromHowtomakes < ActiveRecord::Migration[6.0]
  def change
    remove_column :howtomakes, :image, :string
  end
end
