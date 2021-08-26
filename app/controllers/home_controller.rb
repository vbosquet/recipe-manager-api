class HomeController < ApplicationController
  def search
    query = params[:search].presence && params[:search][:query]

    if query
      @posts = Recipe.search(query)
    end
  end
end
