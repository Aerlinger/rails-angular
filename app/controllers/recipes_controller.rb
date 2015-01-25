class RecipesController < ApplicationController
  def index
    @recipes = if params[:keywords]
                 Recipe.where('UPPER(name) like ?', "%#{params[:keywords].upcase}%")
               else
                 []
               end
  end
end
