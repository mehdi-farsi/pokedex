# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PokedexController, type: :controller do
  let(:response_body) { JSON.parse(response.body) }

  describe 'GET /pokedex' do
    subject { get :index }

    let(:pokemons_count) { 3 }

    before { create_list(:pokemon, pokemons_count) }

    context '200' do
      before { subject }

      it do
        expect(response).to be_successful
        expect(response_body['data'].count).to eq(pokemons_count)

        pokemon = response_body['data'].first

        expect(pokemon).to match_schema(:pokemon)
      end
    end
  end

  describe 'GET /pokedex/:name' do
    subject { get :show, params: { id: pokemon.name } }

    before { subject }

    context '200' do
      let(:pokemon) { create(:pokemon) }

      it do
        expect(response).to be_successful
        expect(response_body['data']).not_to be_kind_of(Array)

        pokemon = response_body['data']

        expect(pokemon).to match_schema(:pokemon)
      end
    end

    context '404' do
      let(:pokemon) { double(name: 'invalid') }

      it { expect(response).to have_http_status(:not_found) }
    end
  end

  describe 'POST /pokedex/' do
    subject { post :create, params: { pokemon: pokemon_params } }

    let(:pokemon_params) { pokemon.attributes.except('id', 'created_at', 'updated_at') }

    context '201' do
      let(:pokemon) { build(:pokemon) }

      it do
        expect { subject }.to change(Pokemon, :count).from(0).to(1)

        expect(response).to have_http_status(:created)
        expect(response_body['data']).not_to be_kind_of(Array)

        pokemon = response_body['data']

        expect(pokemon).to match_schema(:pokemon)
      end
    end
  end

  describe 'PUT /pokedex/:name' do
    subject { put :update, params: { id: pokemon.name, pokemon: pokemon_params } }

    let(:new_pokemon_hp) { pokemon.hp + 1 }
    let(:pokemon_params) { { hp: new_pokemon_hp } }

    context '200' do
      let(:pokemon) { create(:pokemon) }

      it do
        expect(pokemon.hp).not_to eq(new_pokemon_hp)

        subject

        expect(response).to be_successful
        expect(response_body['data']).not_to be_kind_of(Array)

        pokemon = response_body['data']

        expect(pokemon).to match_schema(:pokemon)

        expect(pokemon['attributes']['hp']).to eq(new_pokemon_hp)
      end
    end

    context '404' do
      let(:pokemon) { double(name: 'invalid', hp: 42) }

      before { subject }

      it { expect(response).to have_http_status(:not_found) }
    end
  end

  describe 'DELETE /pokedex/:name' do
    subject { delete :destroy, params: { id: pokemon.id } }

    context '200' do
      let!(:pokemon) { create(:pokemon) }

      it do
        expect { subject }.to change(Pokemon, :count).from(1).to(0)
        expect(response).to be_successful
      end
    end
  end
end
