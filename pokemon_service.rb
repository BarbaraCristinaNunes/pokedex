# frozen_string_literal: true
#require 'uri';
require 'net/http';
require 'json';
module Crud
  def get_pokemonByIdCrud(id)
    res = Net::HTTP.get_response(URI('https://pokeapi.co/api/v2/pokemon/'+ id));
    JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess);
  end
  def get_evolutionsCrud(id, name)
    res = Net::HTTP.get_response(URI('https://pokeapi.co/api/v2/pokemon-species/' + name));
    JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess);
  end
end