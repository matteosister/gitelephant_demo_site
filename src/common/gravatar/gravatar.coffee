angular.module('gravatar', [])

.filter 'gravatar', (md5) ->
    (email) ->
        console.log email
        hash = md5.createHash(email.trim().toLowerCase())
        "http://www.gravatar.com/avatar/#{hash}?s=20"