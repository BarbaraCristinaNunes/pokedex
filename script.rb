
require_relative 'pokemon_service'
module Script

  service = PokemonService::PokemonService.new
  pokemon = service.get_pokemon_by_name("wurmple")

  myPokemon = {
    :id => pokemon.id,
    :name => pokemon.name,
    :types => pokemon.types,
    :powers => pokemon.abilities,
    :evolutions => pokemon.evolutions,
  }

  puts myPokemon

end