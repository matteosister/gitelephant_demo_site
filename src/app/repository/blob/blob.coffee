angular.module('geds.repository.blob', ['ui.router'])

.config ($stateProvider) ->
    $stateProvider.state 'repository.blob',
        url: '/blob/{ref}/{path:.*}'
        views:
            "main":
                controller: 'BlobCtrl',
                templateUrl: 'repository/blob/blob.tpl.html'
        data:
            pageTitle: 'Blob'

.controller 'BlobCtrl', ($scope, $stateParams, Repo) ->
    $scope.slug = $stateParams.slug
    $scope.repo = Repo
    $scope.repo.setRef($stateParams.ref)
    $scope.repo.setPath($stateParams.path)
    $scope.repo.fetchTree()
    $scope.repo.fetchBlob()

.directive 'hljs', ($sce) ->
    link = (scope, element) ->
        console.log 'ci sono'
        console.log element.html()

    restrict: 'A'
    scope: {
        repo: '='
    }
    template: '<pre class="hljs" ng-bind-html="repo.blobRaw.value"></pre>'
