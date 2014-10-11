angular.module('geds.home', ['ui.router'])

.config ($stateProvider) ->
    $stateProvider.state 'home',
        url: '/home'
        views:
            "main":
                controller: 'HomeCtrl',
                templateUrl: 'home/home.tpl.html'
        data:
            pageTitle: 'Home'

.controller 'HomeCtrl', ($scope) ->
    console.log 'home'