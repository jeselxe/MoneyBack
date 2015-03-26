class Atoms.Organism.Menu extends Atoms.Organism.Aside

  @scaffold "assets/scaffold/menu.json"


  # -- Children bubble events --------------------------------------------------
  onButtonTouch: (event, dispatcher, hierarchy...) ->
    # Your code....................Jesus

  onInicioPressed: (event, dispatcher, hierarchy...) ->
  	Atoms.Url.path "inicio/personas"

new Atoms.Organism.Menu()
