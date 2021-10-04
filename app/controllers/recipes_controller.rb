class RecipesController < ApplicationController

  def index
    # @recipes = Recipe.left_outer_joins(:favorites).group(recipes.id).select(recipes.* , count(favorites.* as fav_count)).order(fav_count: desc)
    @recipes = Recipe.all
    @materials = @recipes.materials
  end

  def new
  end

  def create
  end

end
