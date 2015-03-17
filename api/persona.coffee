"use strict"

Hope    = require("zenserver").Hope
Persona = require "../common/models/persona"

module.exports = (server) ->

  server.get "/api/persona", (request, response) ->
    Persona.search().then (error, result) ->
      if error
        response.json message: error.message, error.code
      else
        response.json personas: (persona.parse() for persona in result)


  server.post "/api/persona", (request, response) ->
    if request.required ["name"]
      Persona.register(request.parameters).then (error, result) ->
        if error
          response.json message: error.message, error.code
        else
          response.json persona: result.parse()

  server.delete "/api/persona", (request, response) ->
    if request.required ["name"]
      Hope.shield([ ->
        query = 
          name: request.parameters.name
        Persona.searchOne query, limit=1
      , (error, persona) ->
        persona.delete()
      ]).then (error, result) ->
        if error
          response.json message: error.message, error.code
        else
          response.ok()
          
  server.put "/api/persona", (request, response) ->
    if request.required ["name", "debo", "debe"]
      Hope.shield([ ->
        query =
          name: request.parameters.name
        Persona.searchOne query, limit=1
      , (error, persona) ->
        persona.update request.parameters
      ]).then (error, result) ->
        if error
          response.json message: error.message, error.code
        else
          response.json result.parse()
        
        
    