angular.module('geds.repository.tree', ['ui.router'])

.config ($stateProvider) ->
    $stateProvider.state 'repository.tree',
        url: '/tree/{ref}/{path:.*}'
        views:
            "main":
                controller: 'TreeCtrl',
                templateUrl: 'repository/tree/tree.tpl.html'
        data:
            pageTitle: 'Tree'

.controller 'TreeCtrl', ($scope, $stateParams, Repo) ->
    console.log $stateParams
    $scope.slug = $stateParams.slug
    $scope.repo = Repo
    $scope.repo.setPath($stateParams.path)
    $scope.repo.fetchTree()