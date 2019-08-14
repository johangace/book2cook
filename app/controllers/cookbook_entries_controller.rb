class CookbookEntriesController < ApplicationController
  before_action :set_book
  before_action :set_recipe


def show
end

  def create
    CookbookEntry.find_or_create_by(book: @book, recipe: @recipe)
    redirect_back fallback_location: recipes_path, notice: "#{@recipe.name} added to #{@book.name}!"
  end

  def destroy
    CookbookEntry.where(book: @book, recipe: @recipe).destroy_all
    redirect_back fallback_location: recipes_path, notice: "#{@recipe.name} removed from #{@book.name}!" 
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

end
