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

.controller 'RepositoryCtrl', ($scope, $stateParams, $state, Repo) ->
    $scope.slug = $stateParams.slug
    unless $stateParams.path?
        $state.go 'repository.tree', { slug: 'git-rest', ref: 'master' }

.service 'Repo', class Repo
    constructor: (Restangular) ->
        @restangular = Restangular
        @restangular.addResponseInterceptor (data, operation, what, url, response, deferred) =>
            if operation is 'getList'
                @isRoot = data.is_root
                @parent = data.parent
                @subject = data.subject
                return data.children
            data

    setPath: (path) ->
        @path = path

    getParams: ->
        params = {}
        if @path != ''
            params.path = @path
        params

    fetchTree: ->
        console.log 'fetchTree'
        @tree = @restangular.all('tree').getList(@getParams()).$object
