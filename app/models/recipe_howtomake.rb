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

  delegate :persisted?, to: :recipe

  def initialize(attributes = {}, recipe: Recipe.new)
    @recipe = recipe
    attributes ||= default_attributes
    super(attributes)
  end

  def save
    recipe = Recipe.create(name: name, chach_copy: chach_copy, point: point, upbringing: upbringing, many: many, price: price,
                           image: image, user_id: user_id)
    Material.create(material_name: material_name, quantity: quantity, material_price: material_price, recipe_id: recipe.id)
    Howtomake.create(text: text, recipe_id: recipe.id)
  end

  def update
    return false if invalid?

    ActiveRecord::Base.transaction do
      recipe = Recipe.update(name: name, chach_copy: chach_copy, point: point, upbringing: upbringing, many: many, price: price,
        image: image, user_id: user_id)
      Material.update(material_name: material_name, quantity: quantity, material_price: material_price, recipe_id: recipe.id)
      Howtomake.update(text: text, recipe_id: recipe.id)
    end
    rescue ActiveRecord::RecordNotFound
      false
  end

  def to_model
    recipe
  end

  private

  attr_reader :recipe

  def default_attributes
    {
      name: recipe.name,
      chach_copy: recipe.chach_copy,
      point: recipe.point,
      upbringing: recipe.upbringing,
      many: recipe.many,
      price: recipe.price,
      image: recipe.image,
      user_id: recipe.user_id,
      material_name: recipe.materials.pluck(:material_name),
      quantity: recipe.materials.pluck(:quantity),
      material_price: recipe.materials.pluck(:material_price),
      text: recipe.howtomakes.pluck(:text)
    }
  end
end
