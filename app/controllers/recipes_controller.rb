class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def edit
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: "#{@recipe.name} added!"
    else
      redirect_to new_recipe_path, alert: "#{@recipe.errors.full_messages.to_sentence.capitalize}."
    end
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "#{@recipe.name} updated!"
    else
      redirect_to edit_recipe_path(@recipe), alert: "#{@recipe.errors.full_messages.to_sentence.capitalize}."
    end
  end


  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def set_recipe
    @recipe = current_user.recipes.find(params[:id])
  end

  def recipe_params
    params.require(:recipe)
      .permit(:image, :name, :ingredients, :instructions, :author, :category)
  end


end
