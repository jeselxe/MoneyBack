"use strict"

class Atoms.Organism.Persona extends Atoms.Organism.Dialog

	@scaffold "assets/scaffold/persona.json"


  # -- Children bubble events --------------------------------------------------
	show: (@selected) ->
		@persona.personaForm.clean()
		@persona.personaForm.value @selected
		super

	onClose: ->
		do @hide
		false

	onDelete: ->
		__.proxy("DELETE", "persona", @selected).then (error, value) =>
      if value
        do @hide
        true

	onFormSubmit: (event, dispatcher, hierarchy...) ->
		if dispatcher.attributes.id is "personaForm"
	    __.proxy("PUT", "persona", dispatcher.value()).then (error, value) =>
	      if value
	        do @hide
	        true

new Atoms.Organism.Persona()