angular
.module('myrecipe')
.controller('RecipesEditController', [
  '$state',
  'RecipesFactory',
  RecipesEditControllerFunction
])

function RecipesEditControllerFunction($state, RecipesFactory){
  this.recipe = RecipesFactory.get({id: $state.params.id})

  this.update = function () {
    this.recipe.$update({id: $state.params.id}, (res) => {
      $state.go('recipesShow', { id: res.id })
    })
  }

  this.destroy = function () {
    this.entry.$delete({id: $state.params.id}, () => {
      $state.go('recipesIndex')
    })
  }
}
