# frozen_string_literal: true

module Pokemons
  # Delete existing Pokemon from database
  class Delete
    include Interactor

    def call
      context.pokemon.destroy
    end
  end
end
