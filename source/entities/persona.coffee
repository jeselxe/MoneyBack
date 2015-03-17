"use strict"

class __.Entity.Persona extends Atoms.Class.Entity

  @fields "name", "debo", "debe", "created_at"

  parse: ->
    text        : @name
    description : "Me Debe: #{@debe} - Le Debo #{@debo}"
    info		: @created_at
