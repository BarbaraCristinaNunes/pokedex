# frozen_string_literal: true
class Pokemon
  def initialize(json)
    @id = json['id']
    @name = json['species']['name'];
    @types = [];
    @powers = [];
    @evolutions = [];
  end

  def get_id
    @id;
  end
  def get_name
    @name;
  end
  def get_types
    @types
  end
  def set_types=(array)
    @types = array
  end
  def get_abilities
    @powers;
  end
  def set_abilities=(array)
    @powers = array
  end
  def get_evolutions
    @evolutions;
  end
  def set_evolutions=(array)
    @evolutions = array
  end
end