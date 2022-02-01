# frozen_string_literal: true

class PokemonSerializer
  include JSONAPI::Serializer
  attributes :id, :external_id, :name, :primary_type, :secondary_type, :total, :hp,
             :attack, :defense, :special_attack, :special_defense, :speed, :generation, :legendary
end
