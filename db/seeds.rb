# frozen_string_literal: true

require 'csv'
require 'open-uri'

csv_stream = URI.open("https://gist.githubusercontent.com/armgilles/194bcff35001e7eb53a2a8b441e8b2c6/raw/92200bc0a673d5ce2110aaad4544ed6c4010f687/pokemon.csv")

rows = CSV.read(csv_stream, headers: true)
progressbar = ProgressBar.new(rows.count)

rows.each do |row|
  next if Pokemon.find_by(name: row['Name'])

  params = {
    external_id:     row['#'],
    name:            row['Name'],
    primary_type:    row['Type 1'],
    secondary_type:  row['Type 2'],
    total:           row['Total'],
    hp:              row['HP'],
    attack:          row['Attack'],
    defense:         row['Defense'],
    special_attack:  row['Sp. Atk'],
    special_defense: row['Sp. Def'],
    speed:           row['Speed'],
    generation:      row['Generation'],
    legendary:       row['Legendary']
  }.with_indifferent_access

  Pokemons::Create.call(params: params)

  progressbar.increment! 1
end

puts "OK"
