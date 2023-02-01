# frozen_string_literal: true
require 'uri';
require 'net/http';
require 'json';
module Crud
  PATH = 'https://pokeapi.co/api/v2/pokemon/'
  def get_pokemonByIdCrud(id)
    res = Net::HTTP.get_response(URI(PATH + id));
    JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)
  end
  def get_evolutionsCrud(name)
    res = Net::HTTP.get_response(URI(PATH + name));
    JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)
  end
end