class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = current_user.recipes
    render json: @recipes
  end

  def show
    @recipe = current_user.recipes.find(params[:id])
    render json: @recipe, :include => :ingredients
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      render json: @recipe
    else
      render json: @recipe.errors
    end
  end

  def update
    @recipe = current_user.recipes.find(params[:id])
    if @recipe.update(recipe_params)
      render json: @recipe
    else
      render json: @recipe.errors
    end
  end

  def destroy
    @recipe = current_user.recipes.find(params[:id])
    if @recipe.destroy
      render json: { message: "removed" }, status: :ok
    else
      render json: @recipe.errors
    end
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :description, ingredients_attributes: [:id, :recipe_id, :name, :quantity, :measure_unit, :_destroy]).merge(user_id: current_user.id)
  end
end
