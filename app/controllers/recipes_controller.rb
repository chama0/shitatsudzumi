class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :chach_copy, :point, :upbringing, :many, :price, :image).merge(user_id: current_user.id)
  end

  def material_params(recipe)
    params.permit(:name, :quantity, :price).merge(recipe_id: recipe.id)
  end

  def howtomake_params(recipe)
    params.permit(:text, :image).merge(recipe_id: recipe.id)
  end
end
