# frozen_string_literal: true
class Pokemon
  attr_accessor :types, :abilities, :evolutions, :name, :id
  def initialize(json)
    @id = json['id']
    @name = json['species']['name']
    @types = []
    @powers = []
    @evolutions = []
  end

  def pokemon
    {
      :id => @id,
      :name => @name,
      :types => @types,
      :powers => @abilities,
      :evolutions => @evolutions,
    }
  end
end