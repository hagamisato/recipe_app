class RecipesController < ApplicationController

  def index
    # @recipes = Recipe.left_outer_joins(:favorites).group(recipes.id).select('recipes.recipe_id , count(favorites.* as fav_count)').order(fav_count: desc)
    # @recipes = Recipe.select('recipes.recipe_id , count(favorites.* as fav_count)').left_outer_joins(:favorites).group(recipes.id).order(fav_count: desc) 

    @recipes = Recipe.joins('left outer join photos on recipes.recipe_id = photos.recipe_id') 
    # @recipes = Recipe.all
    # Recipe.select('').joins('left outer ')

    # @materials = @recipes.materials
  end

  def new
    @recipe = Recipe.new
    @material = Material.new
    # @material = Material.build_material
    @tag = Tag.new
  end

  def create
    data = data_params
    recipe = Recipe.new(title: data[:title], explain: data[:explain], is_browsable: data[:is_browsable], user_id: current_user.id)
    recipe_id = Recipe.maximum(:recipe_id)
    material = Material.new(nm_material: data[:nm_material], amnt_material: data[:amnt_material], recipe_id: recipe_id + 1)
    recipe.save!
    material.save!
    redirect_to recipes_path

  end

  def show
    @recipe = Recipe.joins('left outer join photos on recipes.recipe_id = photos.recipe_id').find(params[:recipe_id])
    @materials = Material.where(recipe_id: params[:recipe_id])
    end

  private

  def data_params
    params.require(:data).permit(:title, :nm_material, :amnt_material, :explain, :is_browsable)
  end

end
