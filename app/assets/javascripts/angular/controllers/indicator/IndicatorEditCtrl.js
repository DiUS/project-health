projectHealthApp.controller('IndicatorEditCtrl', ['$scope', '$location', '$routeParams', 'IndicatorFactory', 'CategoryFactory', function($scope, $location, $routeParams, IndicatorFactory, CategoryFactory) {
    $scope.indicator = IndicatorFactory.show({id: $routeParams.id})
    $scope.categories = CategoryFactory.query();

    $scope.save = function() {
        IndicatorFactory.update($scope.indicator, function() {
            $location.path('/indicators');
        }, function(response) {
            $scope.errors = response.data
        })
    }
}])