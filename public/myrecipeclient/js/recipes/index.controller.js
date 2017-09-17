angular
.module('myrecipe')
.controller('RecipesIndexController',[
  'RecipesFactory',
  '$state',
  '$location',
  '$anchorScroll',
  RecipesIndexControllerFunction
])

function RecipesIndexControllerFunction(RecipesFactory, $state, $location, $anchorScroll){
  var query = ''
  this.filters = []
  this.hideFilter = true

  this.search = function (search) {
    query = search
    this.recipes = RecipesFactory.query({
      search: query
    })
    this.hideFilter = false
    $location.hash('scroll')
    $anchorScroll()
  }

  this.removeAll = function () {
    query = ''
    this.recipes = []
    this.filters.splice(0, this.filters.length)
    this.hideFilter = true
  }

  this.removeFilter = function (index) {
    this.filters.splice(index, 1)
  }

  this.addFilters = function (search) {
    if (search === undefined || search === '') {
      return ''
    } else {
      this.filters.push(search)
      search = ''
    }
    $location.hash('scroll')
    $anchorScroll()
  }

  this.filterFunction = function (recipe) {
    return this.filters.every(filter => {
      return recipe.ingredients.some(ingredient => {
        return ingredient.name.includes(filter)
      })
    })
  }.bind(this)

}
