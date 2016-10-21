class RecipesController < ApplicationController
  def index
    puts "Server logging"
    keyword=params['search']||'chocolate'
    puts keyword
    #get recipes from model
    @recipes = Recipe.for(keyword)
    #TODO handle case when no recipe found
  end
end
