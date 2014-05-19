var projectHealthApp = angular.module('projectHealth',[
    'ngResource',
    'ngRoute'
]);

projectHealthApp.config(['$routeProvider', function($routeProvider) {
    $routeProvider.
        when('/indicators/new', {
            templateUrl: '../angular-templates/indicator/new.html',
            controller: 'IndicatorNewCtrl'
        }).
        when('/indicators/:id', {
            templateUrl: '../angular-templates/indicator/show.html',
            controller: 'IndicatorDetailCtrl'
        }).
        when('/indicators/:id/edit', {
            templateUrl: '../angular-templates/indicator/edit.html',
            controller: 'IndicatorEditCtrl'
        }).
        otherwise({
            templateUrl: '../angular-templates/indicator/list.html',
            controller: 'IndicatorListCtrl'
        })
    }]);