describe("IndicatorListCtrl", function() {
    var IndicatorListCtrl;
    var IndicatorFactory;
    var $scope;

    beforeEach(module('projectHealth'));
    beforeEach(inject(function($controller, $location, $rootScope) {
        $scope = $rootScope.$new();
        IndicatorFactory =  {
            isDeleted: false,
            query: function() {
                if(this.isDeleted) {
                    return []
                } else {
                    return [indicatorFixture.indicator.id1]
                }
            },
            delete: function(item) {
                this.isDeleted = true
            }
        }
        IndicatorListCtrl = $controller('IndicatorListCtrl', {
            $scope: $scope,
            IndicatorFactory: IndicatorFactory
        })
    }))

    it("fetches indicator list", inject(function($location) {
        $location.path('/indicators');
        expect($scope.indicators.length).toBe(1)
    }))

    describe("delete", function() {
        beforeEach(inject(function($location) {
            spyOn(IndicatorFactory, 'delete').and.callThrough()

            $location.path('/indicators');
            $scope.delete($scope.indicators[0])
        }))

        it("passes delete command to service", inject(function($location) {
            expect(IndicatorFactory.delete).toHaveBeenCalledWith(indicatorFixture.indicator.id1)
        }))

        it("deletes object from list", inject(function($location) {
            expect($scope.indicators).not.toContain($scope.indicators[0])
        }))
    })

})