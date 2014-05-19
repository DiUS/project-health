projectHealthApp.controller('IndicatorDetailCtrl', ['$scope', '$routeParams', '$location', 'IndicatorFactory', function($scope, $routeParams, $location, IndicatorFactory) {
    $scope.indicator = IndicatorFactory.show({id: $routeParams.id})
}]);