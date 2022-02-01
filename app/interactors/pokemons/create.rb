# frozen_string_literal: true

module Pokemons
  # Insert new pokemon in database
  class Create
    include Interactor
    include Pokemons::ParamsFormattable

    def call
      context.pokemon = Pokemon.new(pokemon_params)

      context.fail!(errors: context.pokemon.errors) unless context.pokemon.save
    end
  end
end
