http = require "http"
querystring = require "querystring"
api = require "./docker-api-description"

class Docker
  constructor: (options) ->
    options = options || {}

    for object in api
      if object.resource is "docker"
        root = @
      else
        @[object.resource] = {} if not @[object.resource]
        root = @[object.resource]

      root.docs = () ->
        object

      for action in object.actions
        root[action.name] = @api_method action

    @port = options.port || "4243"
    @host = options.host || "127.0.0.1"

  api_method: (action) ->
    expected_parameter = []
    replacements_in_url = action.request.match /\{\w+\}/

    return () =>
      args = Array.prototype.slice.apply arguments
      parameter = {}
      payload = {}
      request = action.request

      if replacements_in_url
        request = action.request.replace replacements_in_url[0], args.shift()

      if action.parameter
        parameter = args.shift()

      if action.payload
        payload = args.shift()

      cb = args.shift()

      # validate parameters
      # validate payload

      @request action.method, request, parameter, payload, cb

      # validate response code

  request: (method, path, parameter, payload, cb) ->
    qs = querystring.stringify parameter
    options = 
      host: @host
      port: @port
      path: "#{path}?#{qs}"
      method: method

    if payload
      options.headers =
        "Content": "application/json"

    req = http.request options, (res) ->

      body = ""
      res.on "data", (chunk) ->
        body += chunk

      res.on "end", () ->
        if res.statusCode is 204
          return cb null

        else if res.statusCode is 200 or res.statusCode is 201
          try
            data = JSON.parse body
          catch e
            console.log e, body

          return cb null, data

        else
          return cb {code: res.statusCode, message: body}

    req.on 'error', (e) ->
      console.log "problem with request: #{e.message}"

    if payload
      req.write JSON.stringify(payload)
    req.end()

module.exports = Docker
