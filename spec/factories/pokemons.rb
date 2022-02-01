# frozen_string_literal: true

FactoryBot.define do
  factory :pokemon do
    external_id { Faker::IDNumber.valid }
    name { Faker::Games::Pokemon.name }
    primary_type { Faker::Lorem.word }
    secondary_type { Faker::Lorem.word }
    total { Faker::Number.between(from: 1, to: 500) }
    hp { Faker::Number.between(from: 1, to: 500) }
    attack { Faker::Number.between(from: 1, to: 500) }
    defense { Faker::Number.between(from: 1, to: 500) }
    special_attack { Faker::Number.between(from: 1, to: 500) }
    special_defense { Faker::Number.between(from: 1, to: 500) }
    speed { Faker::Number.between(from: 1, to: 500) }
    generation { Faker::App.semantic_version }
    legendary { false }
  end
end
