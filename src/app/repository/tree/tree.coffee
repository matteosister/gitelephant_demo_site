angular.module('geds.repository.tree', ['ui.router'])

.config ($stateProvider) ->
    $stateProvider.state 'repository.root',
        url: '/tree/{ref}'
        views:
            "main":
                controller: 'TreeCtrl',
                templateUrl: 'repository/tree/tree.tpl.html'
        data:
            pageTitle: 'Tree'
    $stateProvider.state 'repository.tree',
        url: '/tree/{ref}/{path:.*}'
        views:
            "main":
                controller: 'TreeCtrl',
                templateUrl: 'repository/tree/tree.tpl.html'
        data:
            pageTitle: 'Tree'

.controller 'TreeCtrl', ($scope, $stateParams, Repo) ->
    $scope.slug = $stateParams.slug
    $scope.repo = Repo
    $scope.repo.setPath(if $stateParams.path? then $stateParams.path else '')