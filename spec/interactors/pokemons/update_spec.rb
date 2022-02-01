# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Pokemons::Update do
  subject { service_object_call.success? }

  let(:hp) { 42 }
  let!(:pokemon) { create(:pokemon, hp: hp) }
  let(:params) { { 'hp' => hp + 1 } }
  let(:kw_args) do
    { params: params, pokemon: pokemon }
  end

  let(:service_object_call) { described_class.call(kw_args) }

  context 'when success' do
    it { is_expected.to be_truthy }
    it { expect { subject }.to change(Pokemon, :count).by(0) }

    describe '#pokemon' do
      subject { service_object_call.pokemon }

      it 'is a valid Pokemon' do
        is_expected.to be_kind_of(Pokemon)
        is_expected.to be_valid

        expect(subject.reload.hp).to eq(hp + 1)
      end
    end
  end
end
