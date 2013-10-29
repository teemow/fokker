# Fokker

Yet another wrapper around the docker REST API. It has a simple API description that can be changed easily.

## Example

    var Fokker = require("fokker");
    var docker = new Fokker({host: "127.0.0.1",port: "4243"});
    docker.container.list({all:true}, function(err, containers) {
        console.log(containers);
    });
