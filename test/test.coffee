assert = require "assert"
should = require('chai').should()

Fokker = require '../lib/fokker'

describe 'fokker', ->
  it "should at least work", ->
    docker = new Fokker()
    docker.container.list.should.be.a "Function"
