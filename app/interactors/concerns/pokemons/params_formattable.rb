# frozen_string_literal: true

module Pokemons
  module ParamsFormattable
    def pokemon_params
      context.params = context.params.with_indifferent_access if context.params.respond_to?(:with_indifferent_access)

      {
        external_id:     context.params['external_id'],
        name:            context.params['name'],
        primary_type:    context.params['primary_type'],
        secondary_type:  context.params['secondary_type'],
        total:           context.params['total'],
        hp:              context.params['hp'],
        attack:          context.params['attack'],
        defense:         context.params['defense'],
        special_attack:  context.params['special_attack'],
        special_defense: context.params['special_defense'],
        speed:           context.params['speed'],
        generation:      context.params['generation'],
        legendary:       legendary
      }.compact
    end

    private
      def legendary
        if context.params['legendary'].respond_to?(:downcase)
          ActiveRecord::Type::Boolean.new.deserialize(context.params['legendary']&.downcase)
        else
          context.params['legendary']
        end
      end
  end
end
