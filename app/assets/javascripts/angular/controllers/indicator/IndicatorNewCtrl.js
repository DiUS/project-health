projectHealthApp.controller('IndicatorNewCtrl', ['$scope', '$location', '$routeParams', 'IndicatorFactory', 'CategoryFactory', function($scope, $location, $routeParams, IndicatorFactory, CategoryFactory) {
    $scope.indicator = {};
    $scope.categories = CategoryFactory.query();

    $scope.save = function() {
        IndicatorFactory.create($scope.indicator, function () {
            $location.path('/indicators');
        }, function (response) {
            $scope.errors = response.data
        })
    }
}]);