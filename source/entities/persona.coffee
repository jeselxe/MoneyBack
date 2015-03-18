"use strict"

class __.Entity.Persona extends Atoms.Class.Entity

  @fields "name", "debo", "debe", "created_at"

  @createOrUpdate: (attributes) =>
  	entity = @findBy "name", attributes.name
  	if entity?
  		entity.updateAttributes attributes
  	else
  		@create attributes
  	
  	
  parse: ->
    text        : @name
    description : "Me Debe: #{@debe} - Le Debo #{@debo}"
    info		: @created_at
