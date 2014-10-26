angular.module('geds.repository', ['ui.router'])

.config ($stateProvider) ->
    $stateProvider.state 'repository',
        url: '/{slug}'
        views:
            "main":
                controller: 'RepositoryCtrl',
                templateUrl: 'repository/repository.tpl.html'
        data:
            pageTitle: 'Repository'

.controller 'RepositoryCtrl', ($scope, $stateParams, $state) ->
    $state.transitionTo 'repository.root', { slug: $stateParams.slug, ref: 'master' }

.service 'Repo', class Repo
    constructor: (Restangular) ->
        @restangular = Restangular
        @restangular.addResponseInterceptor (data, operation, what, url, response, deferred) ->
            if operation is 'getList'
                return data.children
            data

    setPath: (path) ->
        @path = path
        @fetchTree()

    fetchTree: ->
        if @path == ''
            @tree = @restangular.all('tree').all('master').getList().$object
        else
            @tree = @restangular.all('tree').all('master').all(@path).getList().$object
