controllers = angular.module('CategoriesControllers',[])
controllers.controller("CategoriesController", [ '$scope'
  ($scope)->
    $scope.newProductButton = true
])