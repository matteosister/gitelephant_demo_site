angular.module("geds", [
    "templates-app"
    "templates-common"
    "ui.router"
    "geds.home"
])
.config ($stateProvider, $urlRouterProvider) ->
    $urlRouterProvider.otherwise "/home"
.run(->)
.controller "AppCtrl", AppCtrl = ($scope, $location) ->
    $scope.$on "$stateChangeSuccess", (event, toState, toParams, fromState, fromParams) ->
        if angular.isDefined(toState.data.pageTitle)
            $scope.pageTitle = toState.data.pageTitle + " | GitElephant Demo Site"
