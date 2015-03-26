"use strict"

class Atoms.Organism.Add extends Atoms.Organism.Dialog

	@scaffold "assets/scaffold/add.json"

	show: (algo) ->
		@new.newpersonform.clean()
		super

	onClose: ->
		do @hide
		true

	onFormSubmit: (event, dispatcher, hierarchy...) ->
    __.proxy("POST", "persona", dispatcher.value()).then (error, value) =>
      if value
        __.Entity.Persona.create value.persona
        do @hide

new Atoms.Organism.Add()