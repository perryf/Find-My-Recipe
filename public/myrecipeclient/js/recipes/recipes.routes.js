angular
.module('myrecipe')
.config([
  '$stateProvider',
  '$urlRouterProvider',
  RouterFunction
])


function RouterFunction($stateProvider, $urlRouterProvider){
  $stateProvider
  .state('recipesIndex', {
    url: '/recipes',
    templateUrl: 'myrecipeclient/js/recipes/index.html',
    controller: 'RecipesIndexController',
    controllerAs: 'vm'
  })
  .state('recipesNew',{
    url: '/recipes/new',
    templateUrl: 'myrecipeclient/js/recipes/new.html',
    controller: 'RecipesNewController',
    controllerAs: 'vm'
  })
  .state('recipesEdit',{
    url: '/recipes/:id/edit',
    templateUrl: 'myrecipeclient/js/recipes/edit.html',
    controller: 'RecipesEditController',
    controllerAs: 'vm'
  })
  .state('recipesShow',{
    url: '/recipes/:id',
    templateUrl: 'myrecipeclient/js/recipes/show.html',
    controller: 'RecipesShowController',
    controllerAs: 'vm'
  })
  $urlRouterProvider.otherwise('/recipes')
}
