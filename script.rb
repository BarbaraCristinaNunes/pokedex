# frozen_string_literal: true
#require_relative 'pokemon';
require_relative 'pokemon_service'
module Script

  service = PokemonService::PokemonService.new
  pokemon = service.get_pokemon("eevee")
  myPokemon = {
    :id => pokemon.get_id,
    :name => pokemon.get_name,
    :types => pokemon.get_types,
    :powers => pokemon.get_abilities,
    :evolutions => pokemon.get_evolutions,
  }

  puts myPokemon;

end