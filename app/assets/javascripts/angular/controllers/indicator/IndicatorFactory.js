projectHealthApp.factory('IndicatorFactory', function ($resource) {
    return $resource('/api/indicators/:id.json', {}, {
        query: { method: 'GET', isArray: true },
        create: { method: 'POST' },
        show: { method: 'GET', params: {id: '@id'} },
        update: { method: 'PUT', params: {id: '@id'} },
        delete: { method: 'DELETE', params: {id: '@id'} }
    })
});