describe("IndicatorNewCtrl", function() {
    var IndicatorNewCtrl;
    var IndicatorFactory;
    var $scope

    beforeEach(module('projectHealth'));
    beforeEach(inject(function ($controller, $location, $rootScope, _IndicatorFactory_) {
        $scope = $rootScope.$new();
        IndicatorFactory = _IndicatorFactory_
        IndicatorNewCtrl = $controller('IndicatorNewCtrl', {
            $scope: $scope,
            IndicatorFactory: IndicatorFactory
        })
    }))

    it("create empty indicator", inject(function ($location) {
        $location.path('/indicators/new');
        expect($scope.indicator).toEqual({})
    }))

    it("calls save on service", inject(function ($location) {
        spyOn(IndicatorFactory, 'create')
        $scope.save();

        expect(IndicatorFactory.create).toHaveBeenCalled()
    }))
})