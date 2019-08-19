class SearchesController < ApplicationController
  def show
    term      = params[:term]
    recipes   = Recipe.search(term)
    profiles  = Profile.search(term)
    if term.present?
      results = recipes + profiles
    else
      results= []
    end
    render json: results
  end
 end
