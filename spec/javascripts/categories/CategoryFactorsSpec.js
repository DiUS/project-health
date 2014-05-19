describe("CategoryFactory", function() {
    beforeEach(module('projectHealth'));

    it("query all", inject(function($httpBackend, CategoryFactory) {
        $httpBackend.expectGET('/api/categories.json').respond(200, [categoryFixture.id1, categoryFixture.id2])

        var categories = CategoryFactory.query();
        $httpBackend.flush()

        expect(categories.length).toBe(2);
    }))

    it("get", inject(function($httpBackend, CategoryFactory) {
        $httpBackend.expectGET('/api/categories/1.json').respond(200, categoryFixture.id1)

        var category = CategoryFactory.show({id: 1})
        $httpBackend.flush()

        expect(category.id).toBe(1)
    }))

    it("delete", inject(function($httpBackend, CategoryFactory) {
        $httpBackend.expectGET('/api/categories/1.json').respond(200, categoryFixture.id1)

        var category = CategoryFactory.show({id: 1})
        $httpBackend.flush()

        $httpBackend.expectDELETE('/api/categories/1.json').respond(204)
        category.$delete();
        $httpBackend.flush()
    }))

});