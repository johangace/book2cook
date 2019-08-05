class RecipesController < ApplicationController
  def index
    @recipes =Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
  
  def new
    @recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(recipe_params)
  
  if @recipe.save
   
    @recipe.image.attach(params[:recipe][:image])
  redirect_to @recipe
  else 
    render "new"
  end
end

  def update
    @recipe = Recipe.find(params[:id]) 
  
    if @recipe.update(recipe_params)
     
      @recipe.image.attach(params[:recipe][:image])
      redirect_to @recipe
    else
      render "edit"
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
  
    redirect_to recipes_path
  end


  
private
  def recipe_params
    params.require(:recipe)
    .permit(:image, :name, :ingredients, :instructions, :author, :category )
  end


end
