describe("IndicatorFactory", function() {
    beforeEach(module('projectHealth'));

    it("get indicator list from backend", inject(function($httpBackend, IndicatorFactory) {
        $httpBackend.whenGET('/api/indicators.json').respond(200, [indicatorFixture.indicator.id1, indicatorFixture.indicator.id2])

        var indicators = IndicatorFactory.query();
        $httpBackend.flush()

        expect(indicators.length).toBe(2);
    }))

    it("get indicator", inject(function($httpBackend, IndicatorFactory) {
        $httpBackend.expectGET('/api/indicators/1.json').respond(200, indicatorFixture.indicator.id1)

        var indicator = IndicatorFactory.show({id: 1})
        $httpBackend.flush()

        expect(indicator.id).toBe(1)
    }))

    it("delete indicator", inject(function($httpBackend, IndicatorFactory) {
        $httpBackend.expectGET('/api/indicators/1.json').respond(200, indicatorFixture.indicator.id1)

        var indicator = IndicatorFactory.show({id: 1})
        $httpBackend.flush()

        $httpBackend.expectDELETE('/api/indicators/1.json').respond(204)
        indicator.$delete();
        $httpBackend.flush()
    }))

});