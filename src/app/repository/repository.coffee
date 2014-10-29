angular.module('geds.repository', ['ui.router'])

.config ($stateProvider, $urlRouterProvider) ->
    $stateProvider.state 'repository',
        url: '/{slug}'
        views:
            "main":
                controller: 'RepositoryCtrl',
                templateUrl: 'repository/repository.tpl.html'
        data:
            pageTitle: 'Repository'
    #$urlRouterProvider.when /^\/(\w)$/, '/$1/tree/master'

.controller 'RepositoryCtrl', ($scope, $stateParams, $state, Repo) ->
    Repo.setSlug $stateParams.slug
#    unless $stateParams.path?
#        $state.go 'repository.tree', { slug: 'git-rest', ref: 'master' }