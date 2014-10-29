angular.module('geds.branch_selector', [])
.directive 'dropdownBranches', ->
    controller: ($scope, Repo) ->
        $scope.repo = Repo
        Repo.fetchBranches()
    restrict: 'E'
    templateUrl: 'branch_selector/branch_selector.tpl.html'
    scope: {
        slug: '='
    }