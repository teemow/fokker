module.exports = [{
  resource: "container"
  actions: [{
    name: "list"
    request: "/containers/json"
    method: "GET"
    parameter:
      all: {type: "boolean", description: "Show all containers. Only running containers are shown by default"}
      limit: {type: "number", description: "Show limit last created containers, include non-running ones."}
      since: {type: "string", description: "Show only containers created since Id, include non-running ones."}
      before: {type: "string", description: "Show only containers created before Id, include non-running ones."}
      size: {type: "boolean", description: "Show the containers sizes"}
    success:
      200: "no error"
    error:
      400: "bad parameter"
      500: "server error"
  }, {
    name: "create"
    request: "/containers/create"
    method: "POST"
    payload:
      Hostname: {type: "string"}
      User: {type: "string"}
      Memory: {type: "number"}
      MemorySwap: {type: "number"}
      AttachStdin: {type: "boolean"}
      AttachStdout: {type: "boolean"}
      AttachStderr: {type: "boolean"}
      PortSpecs: {type: "object"}
      Privileged: {type: "boolean"}
      Tty: {type: "boolean"}
      OpenStdin: {type: "boolean"}
      StdinOnce: {type: "boolean"}
      Env: {type: "object"}
      Cmd: {type: "object"}
      Dns: {type: "object"}
      Image: {type: "string"}
      Volumes: {type: "object"}
      VolumesFrom: {type: "string"}
      WorkingDir: {type: "string"}
    success:
      201: "no error"
    error:
      404: "no such container"
      406: "impossible to attach (container not running)"
      500: "server error"
  }, {
    name: "get"
    request: "/containers/{id}/json"
    method: "GET"
    success:
      200: "no error"
    error:
      404: "no such container"
      500: "server error"
  }, {
    name: "top"
    request: "/containers/{id}/top"
    method: "GET"
    parameter:
      ps_args: {type: "string", description: "ps arguments to use (eg. aux)"}
    success:
      200: "no error"
    error:
      404: "no such container"
      500: "server error"
  }, {
    name: "changes"
    request: "/containers/{id}/changes"
    method: "GET"
    success:
      200: "no error"
    error:
      404: "no such container"
      500: "server error"
  }, {
    name: "export"
    request: "/containers/{id}/export"
    method: "GET"
    success:
      200: "no error"
    error:
      404: "no such container"
      500: "server error"
  }, {
    name: "start"
    request: "/containers/{id}/start"
    method: "POST"
    payload:
      Binds: {type: "object", description: "bind mounts"}
      ContainerIDFile: {type: "string", description: "write the container id to the file"}
      LxcConf: {type: "object", description: "lxc configuration variables"}
    success:
      204: "no error"
    error:
      404: "no such container"
      500: "server error"
  }, {
    name: "stop"
    request: "/containers/{id}/stop"
    method: "POST"
    parameter:
      t: {type: "number", description: "number of seconds to wait before killing the container"}
    success:
      204: "no error"
    error:
      404: "no such container"
      500: "server error"
  }, {
    name: "restart"
    request: "/containers/{id}/restart"
    method: "POST"
    parameter:
      t: {type: "number", description: "number of seconds to wait before killing the container"}
    success:
      204: "no error"
    error:
      404: "no such container"
      500: "server error"
  }, {
    name: "kill"
    request: "/containers/{id}/kill"
    method: "POST"
    success:
      204: "no error"
    error:
      404: "no such container"
      500: "server error"
  }, {
    name: "attach"
    request: "/containers/{id}/attach"
    method: "POST"
    parameter:
      logs: {type: "boolean", description: "return logs. Default false"}
      stream: {type: "boolean", description: "return stream. Default false"}
      stdin: {type: "boolean", description: "if stream=true, attach to stdin. Default false"}
      stdout: {type: "boolean", description: "if logs=true, return stdout log, if stream=true, attach to stdout. Default false"}
      stderr: {type: "boolean", description: "if logs=true, return stderr log, if stream=true, attach to stderr. Default false"}
    success:
      200: "no error"
    error:
      400: "bad parameter"
      404: "no such container"
      500: "server error"
  }, {
    name: "wait"
    request: "/containers/{id}/wait"
    method: "POST"
    success:
      200: "no error"
    error:
      404: "no such container"
      500: "server error"
  }, {
    name: "remove"
    request: "/containers/{id}"
    method: "DELETE"
    parameter:
      v: {type: "boolean", description: "Remove the volumes associated to the container. Default false"}
    success:
      204: "no error"
    error:
      400: "bad parameter"
      404: "no such container"
      500: "server error"
  }, {
    name: "copy"
    request: "/containers/{id}/copy"
    method: "POST"
    payload:
      Resource: {type: "string", description: "Path to the file that should be copied"}
    success:
      200: "no error"
    error:
      404: "no such container"
      500: "server error"
  }]
}, {
  resource: "image"
  actions: [{
    name: "list"
    request: "/images/json"
    method: "GET"
    parameter:
      all: {type: "boolean", description: "Show all containers. Only running containers are shown by default"}
    success:
      200: "no error"
    error:
      400: "bad parameter"
      500: "server error"
  }, {
    name: "create"
    request: "/images/create"
    method: "POST"
    parameter:
      fromImage: {type: "string", description: "name of the image to pull"}
      fromSrc: {type: "string", description: "source to import, - means stdin"}
      repo: {type: "string", description: "repository"}
      tag: {type: "string", description: "tag"}
      registry: {type: "string", description: "the registry to pull from"}
    success:
      200: "no error"
    error:
      500: "server error"
  }, {
    name: "insert"
    request: "/images/{name}/insert"
    method: "POST"
    parameter:
      path: {type: "string", description: "path to insert to file to"}
      url: {type: "string", description: "the file to insert into the image"}
    success:
      200: "no error"
    error:
      500: "server error"
  }, {
    name: "get"
    request: "/images/{name}/json"
    method: "GET"
    success:
      200: "no error"
    error:
      404: "no such image"
      500: "server error"
  }, {
    name: "history"
    request: "/images/{name}/history"
    method: "GET"
    success:
      200: "no error"
    error:
      404: "no such image"
      500: "server error"
  }, {
    name: "push"
    request: "/images/{name}/push"
    method: "POST"
    parameter:
      registry: {type: "string", description: "the registry you wan to push, optional"}
    success:
      200: "no error"
    error:
      404: "no such image"
      500: "server error"
  }, {
    name: "tag"
    request: "/images/{name}/tag"
    method: "POST"
    parameter:
      repo: {type: "string", description: "The repository to tag in"}
      force: {type: "boolean", description: "Force tagging. Default false"}
    success:
      200: "no error"
    error:
      400: "bad parameter"
      404: "no such image"
      409: "conflict"
      500: "server error"
  }, {
    name: "remove"
    request: "/images/{name}"
    method: "DELETE"
    success:
      200: "no error"
    error:
      400: "bad parameter"
      404: "no such image"
      409: "conflict"
      500: "server error"
  }, {
    name: "search"
    request: "/images/search"
    method: "GET"
    parameter:
      term: {type: "string", description: "term to search"}
    success:
      200: "no error"
    error:
      500: "server error"
  }]
}, {
  resource: "docker"
  actions: [{
    name: "build"
    request: "/build"
    method: "POST"
    parameter:
      t: {type: "string", description: "repository name"}
      q: {type: "boolean", description: "suppress verbose build output"}
      nocache: {type: "boolean", description: "do not use the cache when building the image"}
    success:
      200: "no error"
    error:
      500: "server error"
  }, {
    name: "auth"
    request: "/auth"
    method: "POST"
    payload:
      username: {type: "string", description: "User for the registry"}
      password: {type: "string", description: "Password of the user"}
      email: {type: "string", description: "Email address of the user"}
      serveraddress: {type: "string", description: "Registry url"}
    success:
      200: "no error"
      204: "no error"
    error:
      500: "server error"
  }, {
    name: "info"
    request: "/info"
    method: "GET"
    success:
      200: "no error"
    error:
      500: "server error"
  }, {
    name: "version"
    request: "/version"
    method: "GET"
    success:
      200: "no error"
    error:
      500: "server error"
  }, {
    name: "commit"
    request: "/commit"
    method: "POST"
    parameter:
      container: {type: "string", description: "source container"}
      repo: {type: "string", description: "repository"}
      tag: {type: "string", description: "tag"}
      m: {type: "string", description: "commit message"}
      author: {type: "string", description: "author (eg. “John Hannibal Smith <hannibal@a-team.com>”)"}
      run: {type: "object", description: "config automatically applied when the image is run. (ex: {“Cmd”: [“cat”, “/world”], “PortSpecs”:[“22”]})"}
    success:
      201: "no error"
    error:
      404: "no such container"
      500: "server error"
  }, {
    name: "events"
    request: "/events"
    method: "POST"
    parameter:
      since: {type: "number", description: "timestamp used for polling"}
    success:
      200: "no error"
      500: "server error"
  }]
}]


