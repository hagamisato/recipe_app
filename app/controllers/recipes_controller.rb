class RecipesController < ApplicationController
  before_action do
    return unless Rails.env.development?
  
    ActiveStorage::Current.host = request.base_url
  end

  def index
    # @recipes = Recipe.left_outer_joins(:favorites).group(recipes.id).select('recipes.recipe_id , count(favorites.* as fav_count)').order(fav_count: desc)
    # @recipes = Recipe.select('recipes.recipe_id , count(favorites.* as fav_count)').left_outer_joins(:favorites).group(recipes.id).order(fav_count: desc) 

    @recipes = Recipe.joins('left outer join photos on recipes.recipe_id = photos.recipe_id')
                     .joins('join materials on recipes.recipe_id = materials.recipe_id')
                     .joins('join users on users.id = recipes.user_id')
                     .order(recipe_id: :desc)
    # @recipes = Recipe.all
    # Recipe.select('').joins('left outer ')

    # @materials = @recipes.materials
  end

  def new
    @recipe = Recipe.new
    @materials = Material.new
    # @material = Material.build_material
    @tag = Tag.new
  end

  def create
    recipe = recipe_params
    material_list = material_list_params
    recipe = Recipe.new(title: recipe[:title], explain: recipe[:explain], is_browsable: recipe[:is_browsable], user_id: current_user.id)
    recipe_id = Recipe.maximum(:recipe_id)
    material_list = Material.new(nm_material: material_list[:nm_material], amnt_material: material_list[:amnt_material], recipe_id: recipe_id)
    recipe_invalid = recipe.invalid?
    materials_invalid = material_list.invalid?

    if recipe_invalid || materials_invalid
      @recipe = recipe
      @materials = material_list
      render 'new'
    else
      recipe.save!
      material_list.recipe_id = recipe.recipe_id
      material_list.save!
      redirect_to recipes_path
    end
  end

  def show
    @recipe = Recipe.joins('left outer join photos on recipes.recipe_id = photos.recipe_id').find(params[:recipe_id])
    @materials = Material.find_by(recipe_id: params[:recipe_id])
    # @recipe = Recipe.joins('left outer join photos on recipes.recipe_id = photos.recipe_id')
    #                  .joins('join materials on recipes.recipe_id = materials.recipe_id')
    #                  .find_by(recipe_id: params[:recipe_id])
  end

  def edit
    @recipe = Recipe.joins('left outer join photos on recipes.recipe_id = photos.recipe_id').find(params[:recipe_id])
    @materials = Material.find_by(recipe_id: params[:recipe_id])
  end

  def update
    recipe_data = recipe_params
    material_list_data = material_list_params
    recipe = Recipe.find(params[:recipe_id]) 
    material_list = Material.find_by(recipe_id: params[:recipe_id])
    recipe.assign_attributes(recipe_data)
    material_list.assign_attributes(material_list_data)

    recipe_invalid = recipe.invalid?
    materials_invalid = material_list.invalid?

    if recipe_invalid || materials_invalid
      @recipe = recipe
      @materials = material_list
      render 'edit'
    else
      recipe.update!(title: recipe[:title], explain: recipe[:explain], is_browsable: recipe[:is_browsable]) 
      material_list.update!(amnt_material: material_list[:amnt_material], nm_material: material_list[:nm_material]) 
      redirect_to recipe_path(recipe_id: recipe.recipe_id)
    end
  end

  def destroy
    recipe = Recipe.find(params[:recipe_id])
    material = Material.find_by(recipe_id: params[:recipe_id])
    recipe.destroy #destroyメソッドを使用し対象のツイートを削除する。
    material.destroy #destroyメソッドを使用し対象のツイートを削除する。
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :explain, :is_browsable)
  end

  def material_list_params
    params.require(:material_list).permit(:nm_material, :amnt_material)
  end
end
