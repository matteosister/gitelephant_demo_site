angular.module('geds.repo', [])
.service 'Repo', class Repo
    constructor: (Restangular, $http) ->
        @restangular = Restangular
        @restangular.addResponseInterceptor (data, operation, what, url, response, deferred) =>
            if operation is 'getList' and what is 'tree'
                @isRoot = data.is_root
                @parent = data.parent
                @subject = data.subject
                return data.children
            data

    setSlug: (slug) ->
        @slug = slug

    setRef: (ref) ->
        @ref = ref

    setPath: (path) ->
        @path = path

    getTreeParams: ->
        params = { ref: @ref }
        if @path != ''
            params.path = @path
        params

    changeBranch: (branch) ->
        console.log branch

    fetchTree: ->
        @tree = @restangular.all('tree').getList(@getTreeParams()).$object
        @blobRaw = ''

    fetchBranches: ->
        @branches = @restangular.all('branches').getList().$object

    fetchBlob: ->
        @restangular.all('blob').getList(@getTreeParams()).then (blob) =>
            @blob = blob
            @blobRawGenerate()

    blobRawGenerate: ->
        @blobRaw = (_.pluck @blob, 'c').join '\n'