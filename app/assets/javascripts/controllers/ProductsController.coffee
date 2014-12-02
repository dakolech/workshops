controllers = angular.module('ProductsControllers',[])
controllers.controller("ProductsController", [ '$scope'
  ($scope)->
    $scope.newReviewButton = true
])