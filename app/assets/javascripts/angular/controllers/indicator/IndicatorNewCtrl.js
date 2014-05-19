projectHealthApp.controller('IndicatorNewCtrl', ['$scope', '$location', '$routeParams', 'IndicatorFactory', function($scope, $location, $routeParams, IndicatorFactory) {
    $scope.indicator = {};

    $scope.save = function() {
        IndicatorFactory.create($scope.indicator, function () {
            $location.path('/indicators');
        }, function (response) {
            $scope.errors = response.data
        })
    }
}]);