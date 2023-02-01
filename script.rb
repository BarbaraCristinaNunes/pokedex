# frozen_string_literal: true
require_relative 'pokemon';



module Script
  Pokemons = [
    {
      :id => 1,
      :name => "bulbasaur",
      :types =>[
        "grass",
        "poison"
      ],
      :favorit => false,
      #:image => "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
      :powers => [
        "Overgrow",
        "Chlorophyll"
      ],
      :evolutions => [
        "bulbasaur",
        "ivysaur",
        "venusaur"
      ]
    },
    {
      :id => 2,
      :name => "ivysaur",
      :types => [
        "grass",
        "poison"
      ],
      :favorit => false,
      #:image => "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png",
      :powers => [
        "Overgrow",
        "Chlorophyll"
      ],
      :evolutions => [
        "bulbasaur",
        "ivysaur",
        "venusaur"
      ]
    },
  ];
  #uri = URI('https://pokeapi.co/api/v2/pokemon/1')
  #res = Net::HTTP.get_response(uri)
  #puts res.body if res.is_a?(Net::HTTPSuccess)

  #puts response.body if response.code == 200
  pk = Pokemon.new("1")
  puts pk.get_pokemonById

  #for pokemon in Pokemons
  #pk = Pokemon.new(pokemon);
  #puts pk.get_pokemon;
  #end

end
