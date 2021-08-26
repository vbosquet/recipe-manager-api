class HomeController < ApplicationController
  def search
    query = params[:query]

    if query
      results = Recipe.search(query)
      @recipe = results.map { |r| r._source}
    end

    render json: @recipe
  end
end
