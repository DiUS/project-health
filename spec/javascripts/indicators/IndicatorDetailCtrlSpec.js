describe("IndicatorDetailCtrl", function() {
    var IndicatorDetailCtrl;
    var IndicatorFactory;
    var $scope

    beforeEach(module('projectHealth'));
    beforeEach(inject(function($controller, $location, $rootScope) {
        $scope = $rootScope.$new();
        IndicatorFactory =  {
            show: function(id) {
                return indicatorFixture.indicator.id1
            }
        }
        IndicatorDetailCtrl = $controller('IndicatorDetailCtrl', {
            $scope: $scope,
            IndicatorFactory: IndicatorFactory
        })
    }))

    it("loads indicator", inject(function($location) {
        $location.path('/indicators/1');
        expect($scope.indicator).toBe(indicatorFixture.indicator.id1)
    }))
})