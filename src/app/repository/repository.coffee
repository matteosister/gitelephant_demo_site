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
    unless $stateParams.path?
        $state.transitionTo 'repository.tree', { slug: 'git-rest', ref: 'master' }
    ###$scope.slug = $stateParams.slug
    $scope.repo = Repo
    $scope.repo.setPath('')
    $scope.repo.fetchTree()###

.service 'Repo', class Repo
    constructor: (Restangular) ->
        console.log 'constructor'
        @restangular = Restangular
        @restangular.addResponseInterceptor (data, operation, what, url, response, deferred) =>
            if operation is 'getList'
                @isRoot = data.is_root
                @parent = data.parent
                return data.children
            data

    setPath: (path) ->
        #console.log "setPath #{path}"
        @path = path

    getParams: ->
        params = {}
        if @path != ''
            params.path = @path
        params

    fetchTree: ->
        @tree = @restangular.all('tree').getList(@getParams()).$object
