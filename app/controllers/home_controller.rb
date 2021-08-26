class HomeController < ApplicationController
  def search
    results = Recipe.search(search_params[:query], search_params)
    recipes = results.records
    render json: { recipes: recipes }, status: :ok
  end

  private

  def search_params
    params.permit(:query)
  end
end
