angular.module('common.loader', [])
.directive 'loader', ->
    restrict: 'A'
    link: (scope, element, attrs) ->
        element.spin()