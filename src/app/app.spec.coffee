describe "AppCtrl", ->
    describe "isCurrentUrl", ->
        AppCtrl = undefined
        $scope = undefined
        beforeEach module("geds")
        beforeEach inject ($controller, $rootScope) ->
            $scope = $rootScope.$new()
            AppCtrl = $controller "AppCtrl",
                $scope: $scope

        it 'should e set the page title', ->
            $scope.$broadcast '$stateChangeSuccess', { data: { pageTitle: 'test title' } }
            expect($scope.pageTitle).toBeDefined()
            expect($scope.pageTitle).toMatch('^test title')
