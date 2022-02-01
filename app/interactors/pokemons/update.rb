# frozen_string_literal: true

module Pokemons
  # Patch/Update pokemon in database
  class Update
    include Interactor
    include ParamsFormattable

    def call
      context.fail!(errors: context.pokemon.errors) unless context.pokemon.update(pokemon_params)
    end
  end
end
