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

  def save
    recipe = Recipe.create(name: name, chach_copy: chach_copy, point: point, upbringing: upbringing, many: many, price: price, user_id: user.id)
    Material.create(name: name, quantity: quantity, price: price, recipe_id: recipe.id)
    Donation.create(text: text, recipe_id: recipe.id)
  end

end