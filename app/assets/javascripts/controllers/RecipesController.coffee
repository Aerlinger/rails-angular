controllers = angular.module('controllers')
controllers.controller("RecipesController", [
  '$scope',
  '$routeParams',
  '$location',
  '$resource'
  ($scope,
   $routeParams,
   $location
   $resource)->
    $scope.search = (keywords)-> $location.path("/").search('keywords', keywords)

    # Note the resource declaration!
    Recipe = $resource('/recipes/:recipeId', { recipeId: "@id", format: 'json' })

    if $routeParams.keywords
#      keywords = $routeParams.keywords.toLowerCase()
#      $scope.recipes = recipes.filter (recipe) -> recipe.name.toLowerCase().indexOf(keywords) != -1
      Recipe.query(keywords: $routeParams.keywords, (results)-> $scope.recipes = results)

    else
      $scope.recipes = []
])
