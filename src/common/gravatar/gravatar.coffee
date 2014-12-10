angular.module('gravatar', [])

.filter 'gravatar', (md5) ->
    (email, size = 20) ->
        return unless email?
        hash = md5.createHash(email.trim().toLowerCase())
        "http://www.gravatar.com/avatar/#{hash}?s=#{size}"