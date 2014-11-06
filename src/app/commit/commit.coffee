angular.module('geds.commit', ['ui.router'])

.config ($stateProvider) ->
    $stateProvider.state 'commit',
        url: '/commit/{sha}'
        views:
            "main":
                controller: 'CommitCtrl',
                templateUrl: 'commit/commit.tpl.html'
        data:
            pageTitle: 'Commit'

.controller 'CommitCtrl', ($scope, $stateParams, Commit) ->
    $scope.commit = Commit
    $scope.commit.setSha $stateParams.sha
    $scope.commit.fetchCommit()

.service 'Commit', class Commit
    constructor: (Restangular) ->
        @restangular = Restangular

    setSha: (sha) ->
        @sha = sha

    fetchCommit: ->
        @commit = @restangular.one('commit', @sha).get().$object