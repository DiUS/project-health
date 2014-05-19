projectHealthApp.controller('IndicatorEditCtrl', ['$scope', '$location', '$routeParams', 'IndicatorFactory', function($scope, $location, $routeParams, IndicatorFactory) {
    $scope.indicator = IndicatorFactory.show({id: $routeParams.id})

    $scope.save = function() {
        IndicatorFactory.update($scope.indicator, function() {
            $location.path('/indicators');
        }, function(response) {
            $scope.errors = response.data
        })
    }
}])