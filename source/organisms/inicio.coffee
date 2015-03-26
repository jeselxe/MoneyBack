"use strict"

class Atoms.Organism.Inicio extends Atoms.Organism.Article

  @scaffold "assets/scaffold/inicio.json"


  # -- Children bubble events --------------------------------------------------
  onButtonTouch: (event, dispatcher, hierarchy...) ->
    # Your code...

  fetch: ->
    __.proxy("GET", "persona").then (error, value) ->
      __.Entity.Persona.createOrUpdate persona for persona in (value.personas or [])

  addPerson: (event, dispatcher, hierarchy...) ->
    #@new.newpersonform.clean()
    #Atoms.Url.path "inicio/new"
    __.Dialog.Add.show dispatcher

  onSelectPersona: (event, dispatcher, hierarchy...) ->
    personaName = dispatcher.attributes.text
    __.proxy("GET", "persona").then (error, value) ->
      for persona in (value.personas or [])
        if persona.name is personaName
          __.Dialog.Persona.show persona
    #@persona.personaForm.name.value personaName
    #Atoms.Url.path "inicio/persona"

  cargarDatosPersona: (persona) ->
    @persona.personaForm.name.value persona.name
    @persona.personaForm.debeLabel.value persona.debe
    @persona.personaForm.deboLabel.value persona.debo

  onSearchChange: (event, dispatcher, hierarchy...) ->
    persona = dispatcher.value()
    if persona
      @personas.personas.select (entity) -> entity if entity.name.match persona
    else
      @personas.personas.all()

  onSearchSubmit: (event, dispatcher, hierarchy...) ->
    console.log @list.personas
    @personas.personas.findBy "name", dispatcher.value()


  onFormSubmit: (event, dispatcher, hierarchy...) ->
    if dispatcher.attributes.id is "personaForm"
      __.proxy("PUT", "persona", dispatcher.value()).then (error, value) ->
        if value
          Atoms.Url.path "inicio/personas"   
    else
      __.proxy("POST", "persona", dispatcher.value()).then (error, value) ->
        if value
          __.Entity.Persona.create value.persona
          Atoms.Url.path "inicio/personas"



new Atoms.Organism.Inicio()
