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
    console.log 'sssss'
    $scope.slug = $stateParams.slug
    $scope.repo = Repo
    $scope.repo.setRef($stateParams.ref)
    $scope.repo.setPath($stateParams.path)
    $scope.repo.fetchTree()

.filter 'icon', ->
    (type) ->
        switch type
            when 'tree' then 'fa-folder'
            when 'blob' then 'fa-file'

.directive 'breadcrumb', ->
    restrict: 'E'
    templateUrl: 'repository/breadcrumb.tpl.html'
    scope:
        repo: "="
        slug: "="

.filter 'split_path', ->
    (tree) ->
        return unless tree.subject?
        splitPath = tree.subject.full_path.split('/')
        obj = {}
        actualPath = ''
        _.each splitPath, (path) ->
            if actualPath == ''
                actualPath += path
            else
                actualPath += "/#{path}"
            obj[actualPath] = path
        return obj
