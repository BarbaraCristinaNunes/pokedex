
require_relative 'pokemon_service'
module Script

  service = PokemonService::PokemonService.new
  pokemon = service.get_pokemon_by_name("wurmple")
  puts pokemon.pokemon

end