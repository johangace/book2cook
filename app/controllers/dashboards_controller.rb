class DashboardsController < ApplicationController
  def show 
    @recipes = Recipe.last(10)
  end 
end
