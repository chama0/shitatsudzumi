class RecipeHowtomake
  include ActiveModel::Model
  attr_accessor :name, :chach_copy, :point, :upbringing, :many, :price, :quantity, :text

  with_options presence: true do
    validates :name
    validates :chach_copy
    validates :point
    validates :upbringing
    validates :text

    with_options format: { with: /\A[0-9]+\z/ } do
      validates :many
      validates :price
      validates :quantity
    end
  end

end