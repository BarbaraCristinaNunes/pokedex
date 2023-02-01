# frozen_string_literal: true
require_relative 'pokemon';



module Script
  #uri = URI('https://pokeapi.co/api/v2/pokemon/1')
  #res = Net::HTTP.get_response(uri)
  #puts res.body if res.is_a?(Net::HTTPSuccess)

  #puts response.body if response.code == 200

  pokemon = Pokemon.new("1")
  myPokemon = {
  # :id => pokemon['id'],
    :name => pokemon.get_name,
    :types => pokemon.get_types,
    :powers => pokemon.get_abillities,
    :evolutions => pokemon.get_evolutions,
  }#:name => pokemon['species']['name'],
  #or type in pokemon['types']
   #myPokemon[:types] << type['type']['name']
# end
# for ability in pokemon['abilities']
#   myPokemon[:powers] << ability['ability']['name']
 #end

puts pokemon.get_name

  puts myPokemon;
  #for pokemon in Pokemons
  #pk = Pokemon.new(pokemon);
  #puts pk.get_pokemon;
  #end
end