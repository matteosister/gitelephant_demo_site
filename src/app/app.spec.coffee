describe "AppCtrl", ->
    describe "isCurrentUrl", ->
        AppCtrl = undefined
        $location = undefined
        $scope = undefined
        beforeEach module("geds")
        beforeEach inject ($controller, _$location_, $rootScope) ->
            $location = _$location_
            $scope = $rootScope.$new()
            AppCtrl = $controller "AppCtrl",
                $location: $location
                $scope: $scope

        it 'should e set the page title', ->
            $scope.$broadcast '$stateChangeSuccess', { data: { pageTitle: 'test title' } }
            expect($scope.pageTitle).toBeDefined()
            expect($scope.pageTitle).toMatch('^test title')
