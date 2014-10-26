angular.module("geds", [
    "templates-app"
    "templates-common"
    "ui.router"
    "restangular"
    "geds.home"
    "geds.repository"
    "geds.repository.tree"
])

.config ($urlRouterProvider, $locationProvider, RestangularProvider) ->
    $urlRouterProvider.otherwise "/"
    $locationProvider.html5Mode false
    RestangularProvider.setBaseUrl 'http://127.0.0.1:1337'

#.run(->)

.controller "AppCtrl", ($scope) ->
    $scope.$on "$stateChangeSuccess", (event, toState, toParams, fromState, fromParams) ->
        if angular.isDefined(toState.data.pageTitle)
            $scope.pageTitle = toState.data.pageTitle + " | GitElephant Demo Site"
