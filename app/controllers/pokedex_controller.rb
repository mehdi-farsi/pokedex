# frozen_string_literal: true

class PokedexController < ApplicationController
  before_action :set_pokemon, only: %i[ show update destroy ]

  # GET /pokedex
  def index
    @pokemons = Pokemon.ransack(name_cont: params[:q]).result.paginate(page: params[:page], per_page: 25)

    render json: PokemonSerializer.new(@pokemons)
  end

  # GET /pokedex/1
  # GET /pokedex/Avalugg
  def show
    render json: PokemonSerializer.new(@pokemon)
  end

  # POST /pokedex
  def create
    result = Pokemons::Create.call(params: pokemon_params)

    if result.success?
      render json: PokemonSerializer.new(result.pokemon), status: :created
    else
      render json: result.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pokedex/1
  # PATCH/PUT /pokedex/Avalugg
  def update
    result = Pokemons::Update.call(pokemon: @pokemon, params: pokemon_params)

    if result.success?
      render json: PokemonSerializer.new(result.pokemon), status: :created
    else
      render json: result.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pokedex/1
  # DELETE /pokedex/Avalugg
  def destroy
    Pokemons::Delete.call(pokemon: @pokemon)

    head :ok
  end

  private
    def set_pokemon
      @pokemon = Pokemon.id_or_name(params[:id]).first!
    end

    def pokemon_params
      params.require(:pokemon).permit(:id, :external_id, :name, :primary_type, :secondary_type, :total, :hp,
                                      :attack, :defense, :special_attack, :special_defense,
                                      :speed, :generation, :legendary)
    end
end
