controllers = angular.module('controllers',[])
controllers.controller("CategoriesController", [ '$scope'
  ($scope)->
    $scope.newProductButton = true
])