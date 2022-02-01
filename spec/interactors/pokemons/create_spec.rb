# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Pokemons::Create do
  subject { service_object_call.success? }

  let(:params) { build(:pokemon).attributes.except('id', 'created_at', 'updated_at') }
  let(:kw_args) do
    { params: params }
  end
  let(:service_object_call) { described_class.call(kw_args) }

  context 'when success' do
    it { is_expected.to be_truthy }
    it { expect { subject }.to change(Pokemon, :count).from(0).to(1) }

    describe '#pokemon' do
      subject { service_object_call.pokemon }

      it 'is a valid Pokemon' do
        is_expected.to be_kind_of(Pokemon)
        is_expected.to be_valid

        serialized_pokemon = subject.attributes.except('id', 'created_at', 'updated_at')

        expect(serialized_pokemon).to include(params)
      end
    end
  end
end
