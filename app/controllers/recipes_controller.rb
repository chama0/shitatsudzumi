class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @recipes = Recipe.all.order('created_at DESC')
  end

  def new
    @recipe_howtomake = RecipeHowtomake.new
  end

  def create
    @recipe_howtomake = RecipeHowtomake.new(recipe_params)
    if @recipe_howtomake.valid?
      @recipe_howtomake.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.includes(:materials, :howtomakes).find(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe_howtomake).permit(:name, :chach_copy, :point, :upbringing, :many, :price, :material_name, :quantity,
                                             :material_price, :text, :image, :user_id).merge(user_id: current_user.id)
  end
end
