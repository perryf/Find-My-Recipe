/* global angular */
angular.module('myrecipe')
.factory('RecipesFactory',[
  '$resource',
  RecipeService
])

function RecipeService($resource){
  return $resource('/api/recipes/:id.json', {}, {
    update: {
      method: 'PUT'
    }
  })
}
