angular
.module('myrecipe')
.controller('RecipesNewController',[
  '$state',
  'RecipesFactory',
  RecipesNewControllerFunction
])



function RecipesNewControllerFunction($state, RecipesFactory){
  this.recipe= new RecipesFactory()
  this.create = function () {
    this.recipe.$save(() => {
      $state.go('recipesIndex')
    })
  }
}
