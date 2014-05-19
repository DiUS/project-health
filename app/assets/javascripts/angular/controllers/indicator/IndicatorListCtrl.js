projectHealthApp.controller('IndicatorListCtrl', ['$scope', 'IndicatorFactory', function($scope, IndicatorFactory) {
    $scope.indicators = IndicatorFactory.query();

    $scope.delete = function(indicator) {
        IndicatorFactory.delete(indicator)
        $scope.indicators = IndicatorFactory.query();
    }
}])