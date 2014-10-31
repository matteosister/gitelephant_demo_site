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

.filter 'prettyprint', ($sce) ->
    (content) ->
        console.log content
        prettyPrint()
        return content


.directive 'prettyprint', ($sce) ->
    replaceText = (str) ->
        str1 = String(str)
        return str1.replace /\n/g, "<br/>"

    link = (scope, element) ->
        element.html('sssss')

    restrict: 'C'
    link: link
    scope: {
        content: '='
    }
