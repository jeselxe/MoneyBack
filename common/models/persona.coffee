"use strict"

Hope    = require("zenserver").Hope
Schema  = require("zenserver").Mongoose.Schema
db      = require("zenserver").Mongo.connections.primary


Persona = new Schema
  name      : type: String
  debo      : type: Number, default: 0
  debe      : type: Number, default: 0
  updated_at: type: Date
  created_at: type: Date, default: Date.now

# -- Static methods ------------------------------------------------------------
Persona.statics.register = (parameters) ->
  promise = new Hope.Promise()
  Persona = db.model "Persona", Persona
  new Persona(parameters).save (error, value) -> promise.done error, value
  promise

Persona.statics.search = (filter) ->
  promise = new Hope.Promise()
  @find(filter).sort("name").exec (error, value) -> promise.done error, value
  promise

Persona.statics.searchOne = (query, limit = 0) ->
  console.log query
  promise = new Hope.Promise()
  @find(query).limit(limit).exec (error, value) ->
    if limit is 1
      error = code: 402, message: "Persona not found." if value.length is 0
      value = value[0] if value.length isnt 0
    promise.done error, value
  promise

# -- Static methods ------------------------------------------------------------
Persona.methods.delete = ->
  promise = new Hope.Promise()
  @remove (error, value) -> promise.done error, value
  promise

Persona.methods.update = (attr) ->
  console.log attr
  console.log @name
  promise = new Hope.Promise()
  @debo = attr.debo if attr.debo
  @debe = attr.debe if attr.debe
  console.log @debe
  console.log @debo
  @save (error, value) -> promise.done error, value
  promise

Persona.methods.parse = ->
  name      : @name
  debo      : @debo
  debe      : @debe
  updated_at: @updated_at
  created_at: @created_at

exports = module.exports = db.model "Persona", Persona
