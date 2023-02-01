# frozen_string_literal: true
require_relative 'crud.rb'

class Pokemon
  include Crud;
  def initialize(id)
    #@pokemon= pokemon;
    @id = id;
  end
  def get_pokemonById
    self.get_pokemonByIdCrud(@id)
  end
end