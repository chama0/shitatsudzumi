class RecipeHowtomake
  include ActiveModel::Model
  attr_accessor :name, :chach_copy, :point, :upbringing, :many, :price, :material_name, :quantity, :material_price, :text,
                :image, :user_id

  with_options presence: true do
    validates :name
    validates :chach_copy
    validates :point
    validates :upbringing
    validates :material_name
    validates :quantity
    validates :text
    validates :image

    with_options format: { with: /\A[0-9]+\z/ } do
      validates :many
      validates :price
      validates :material_price
    end
  end

  def save
    recipe = Recipe.create(name: name, chach_copy: chach_copy, point: point, upbringing: upbringing, many: many, price: price,
                           image: image, user_id: user_id)
    Material.create(material_name: material_name, quantity: quantity, material_price: material_price, recipe_id: recipe.id)
    Howtomake.create(text: text, recipe_id: recipe.id)
  end
end
