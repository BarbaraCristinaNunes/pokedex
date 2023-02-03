# frozen_string_literal: true
require 'net/http'
require 'json'
require_relative 'pokemon'
module PokemonService
  class PokemonService
    def get_pokemon_by_id(id)
      get_pokemon(id.to_s)
    end

    def get_pokemon_by_name(name)
      get_pokemon(name)
    end

    private
    def api_connection
      api_connection = Api_connection.new
      api_connection
    end
    def get_pokemon(identifier)

      res = api_connection.get(URI('https://pokeapi.co/api/v2/pokemon/' + identifier))
      return unless api_connection.success?(res)

      json = JSON.parse(res.body)
      pokemon = Pokemon.new(json)
      populate_type(pokemon, json)
      populate_abilities(pokemon, json)
      #evolution_json = fetch_evolutions(pokemon)
      populate_evolutions(pokemon, json)
      pokemon
    end

    def populate_type(pokemon, json)
      types = json['types'].map { |type| type.dig('type', 'name') }
      pokemon.types = types
    end
    def populate_abilities(pokemon, json)
      abilities = json['abilities'].map { |ability| ability.dig('ability', 'name') }
      pokemon.abilities = abilities
    end
    def populate_evolutions(pokemon, json)
      evolution_json = fetch_evolutions(json['species']['url'])
      evolutions = []
      evolutions << evolution_json['species']['name']
      if evolution_json["evolves_to"]
        evolution_json["evolves_to"].each do |evolution|
          evolutions << evolution['species']["name"]
          if evolution["evolves_to"]
            evolution["evolves_to"].each { |evolve| evolutions << evolve['species']["name"] }
          end
        end
      end
      pokemon.evolutions = evolutions
    end
    def fetch_evolutions(url)
      pathToEvolutions = api_connection.get(URI(url))
      evolutionChainUrl = JSON.parse(pathToEvolutions.body)['evolution_chain']['url'] if api_connection.success?(pathToEvolutions)

      res = api_connection.get(URI(evolutionChainUrl))
      return unless api_connection.success?(res)
      evolution_json = JSON.parse(res.body)['chain']
      evolution_json
    end

  end
  class Api_connection
    def get(url)
      Net::HTTP.get_response url
    end

    def success?(res)
      res.is_a?(Net::HTTPSuccess)
    end
  end
end