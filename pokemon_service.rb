# frozen_string_literal: true
require 'net/http'
require 'json'
require_relative 'pokemon'
module PokemonService
  class PokemonService
    def get_pokemon(input)
      res = Net::HTTP.get_response(URI('https://pokeapi.co/api/v2/pokemon/' + input.to_s))
      json = JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)
      pokemon = Pokemon.new(json)
      get_type(pokemon, json)
      get_abilities(pokemon, json)
      get_evolutions(pokemon, json)
      pokemon
    end


    private
    def get_type(pokemon, json)
      array = []
      json['types'].each { |type| array << type['type']['name'] }
      pokemon.set_types = array
    end
    def get_abilities(pokemon, json)
      array = []
      json['abilities'].each { |ability| array << ability['ability']['name'] }
      pokemon.set_abilities = array
    end
    def get_evolutions(pokemon, json)
      pathToEvolutions = Net::HTTP.get_response(URI(json['species']['url']))
      evolutionChainUrl = JSON.parse(pathToEvolutions.body)['evolution_chain']['url'] if pathToEvolutions.is_a?(Net::HTTPSuccess)

      res = Net::HTTP.get_response(URI(evolutionChainUrl))
      evolutions = JSON.parse(res.body)['chain'] if res.is_a?(Net::HTTPSuccess)

      array = []
      array << evolutions['species']['name']

      if evolutions["evolves_to"]

        evolutions["evolves_to"].each do |evolution|

          array << evolution['species']["name"]

          if evolution["evolves_to"]
            evolution["evolves_to"].each { |evolution| array << evolution['species']["name"] }
          end
        end
      end
      pokemon.set_evolutions = array
    end

  end
end