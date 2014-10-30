angular.module('geds.repository', ['ui.router'])

.config ($stateProvider, $urlRouterProvider) ->
    $urlRouterProvider.when /^\/([\w-]+)$/, '/$1/tree/master/'

    $stateProvider.state 'repository',
        url: '/{slug}'
        views:
            "main":
                controller: 'RepositoryCtrl',
                templateUrl: 'repository/repository.tpl.html'
        data:
            pageTitle: 'Repository'


.controller 'RepositoryCtrl', ($scope, $stateParams, $state, Repo) ->
    Repo.setSlug $stateParams.slug