describe("IndicatorEditCtrl", function() {
    var IndicatorEditCtrl;
    var IndicatorFactory;
    var $scope;
    var $httpBackend;

    beforeEach(module('projectHealth'));
    beforeEach(inject(function($controller, $location, $rootScope, _$httpBackend_, _IndicatorFactory_) {
        $httpBackend = _$httpBackend_;
        $scope = $rootScope.$new();
        IndicatorFactory = _IndicatorFactory_;
        IndicatorEditCtrl = $controller('IndicatorEditCtrl', {
            $scope: $scope,
            IndicatorFactory: _IndicatorFactory_,
            $routeParams: {
                id: 1
            }
        })
    }));
    beforeEach(function() {
        $httpBackend.expectGET('/api/indicators/1.json').respond(200, indicatorFixture.indicator.id1)
    });


    it("load indicator", inject(function($location) {
        $location.path('/indicators/1/edit');
        $httpBackend.flush();
        expect($scope.indicator.id).toBe(indicatorFixture.indicator.id1.id)
    }));

    it("on failure assign errors", inject(function($location) {
        $location.path('/indicators/1/edit');
        $httpBackend.flush();

        var errors = ["Error"];
        $httpBackend.expectPUT('/api/indicators/1.json').respond(422, errors);

        $scope.indicator.name = undefined;

        $scope.save();
        $httpBackend.flush();

        expect($scope.errors).toEqual(errors)
        expect($location.path()).toBe('/indicators/1/edit');
    }));

    it("on success redirect to list", inject(function($location) {
        $location.path('/indicators/1/edit');
        $httpBackend.flush();

        $httpBackend.expectPUT('/api/indicators/1.json').respond(204);
        $scope.save();
        $httpBackend.flush();

        expect($location.path()).toBe('/indicators');
    }));
});