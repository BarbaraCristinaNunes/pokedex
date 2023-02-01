# frozen_string_literal: true
require_relative 'crud.rb'

class Pokemon
  include Crud;
  def initialize(id)
    @id = id;
    pokemon = self.get_pokemonByIdCrud(@id);
    @pokemon = pokemon;
    @name = @pokemon['species']['name'];
    @types = [];
    @powers = [];
    @evolutions = [];
  end
  def get_name
    @name;
  end

  def get_types
    for type in @pokemon['types']
      @types << type['type']['name'];
    end
    @types
  end

  def get_abillities
    for ability in @pokemon['abilities']
      @powers << ability['ability']['name'];
    end
    @powers;
  end

  def get_evolutions
    evolutions = self.get_evolutionsCrud(@name);
    @evolutions << evolutions['species']['name'];

    if evolutions["evolves_to"]

      evolutions["evolves_to"].each { |evolution|

        @evolutions << evolution['species']["name"];

        if evolution["evolves_to"]

          evolution["evolves_to"].each { |evolution|
            @evolutions << evolution['species']["name"];
          }

        end
      }
    end
    @evolutions;
  end
end