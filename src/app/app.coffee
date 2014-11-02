angular.module("geds", [
    "templates-app"
    "templates-common"
    "ui.router"
    "restangular"
    "common.loader"
    "geds.repo"
    "geds.home"
    "geds.repository"
    "geds.repository.tree",
    "geds.repository.blob",
    "geds.branch_selector"
])

.config ($urlRouterProvider, $locationProvider, RestangularProvider, $sceProvider) ->
    $urlRouterProvider.otherwise "/"
    $locationProvider.html5Mode false
    RestangularProvider.setBaseUrl 'http://127.0.0.1:1337'
    $sceProvider.enabled false

.run(->)

.controller "AppCtrl", ($scope) ->
    $scope.$on "$stateChangeSuccess", (event, toState, toParams, fromState, fromParams) ->
        if angular.isDefined(toState.data.pageTitle)
            $scope.pageTitle = toState.data.pageTitle + " | GitElephant Demo Site"
