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
      Api_connection.new
    end
    def get_pokemon(identifier)
      res = api_connection.get(URI('https://pokeapi.co/api/v2/pokemon/' + identifier))
      return unless api_connection.success?(res)

      json = JSON.parse(res.body)
      pokemon = Pokemon.new(json)
      populate_type(pokemon, json)
      populate_abilities(pokemon, json)
      fetch_evolutions(pokemon, json['species']['url'])
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
    def populate_evolutions(pokemon, evolution_json)
      evolutions = pokemon.evolutions
      evolutions << evolution_json.dig('species', 'name')
      if evolution_json["evolves_to"] && evolution_json["evolves_to"].size > 0
        evolves_length = evolution_json["evolves_to"].size
        count = 0
        while count != evolves_length
          next_evolution = evolution_json["evolves_to"][count]
          if next_evolution
            populate_evolutions(pokemon, next_evolution)
          end
          count += 1
        end
      end
      pokemon.evolutions = evolutions
    end
    def fetch_evolutions(pokemon, url)
      path_to_evolutions = api_connection.get(URI(url))
      evolution_chain_url = JSON.parse(path_to_evolutions.body)['evolution_chain']['url']
      return unless api_connection.success?(path_to_evolutions)
      res = api_connection.get(URI(evolution_chain_url))
      return unless api_connection.success?(res)
      json = JSON.parse(res.body)['chain']
      populate_evolutions(pokemon, json)
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