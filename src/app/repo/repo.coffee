angular.module('geds.repo', [])
.service 'Repo', class Repo
    constructor: (Restangular, $sce, $http) ->
        @restangular = Restangular
        @sce = $sce
        @http = $http
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
        @restangular.all('tree').getList(@getTreeParams()).then (tree) =>
            @tree = tree
        @blobRaw = ''

    fetchBranches: ->
        @branches = @restangular.all('branches').getList().$object

    fetchBlob: ->
        url = @restangular.all('blob').getRestangularUrl()
        params = _.merge @getTreeParams(), { pygmentize: 1 }
        @http.get(url, { params: params, transformResponse: (d, h) -> return d}).success (blob) =>
            @blobRaw = blob

    blobRawGenerate: ->
        @blobRaw = @sce.trustAsHtml((_.pluck @blob, 'c').join '\n')