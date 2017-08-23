/* global angular */
angular
.module('myrecipe')
.controller('RecipesShowController',[
  '$stateParams',
  'RecipesFactory',
  RecipesShowControllerFunction
])

function RecipesShowControllerFunction($stateParams, RecipesFactory){
  this.recipe = RecipesFactory.get({id: $stateParams.id})
}
