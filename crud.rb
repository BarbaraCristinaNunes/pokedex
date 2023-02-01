# frozen_string_literal: true
require 'uri';
require 'net/http';

module Crud
  PATH = 'https://pokeapi.co/api/v2/pokemon/'
  def get_pokemonByIdCrud(id)
    res = Net::HTTP.get_response(URI(PATH + id));
    puts res.body if res.is_a?(Net::HTTPSuccess)
  end
end