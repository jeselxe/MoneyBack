"use strict"

class Atoms.Atom.Title extends Atoms.Atom.Label

	@extends 	: true

	@events		: ["change"]

	value: (value) ->
		if value? then @el.text value else @el.val()