# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Pokemons::Delete do
  subject { service_object_call.success? }

  let!(:pokemon) { create(:pokemon) }
  let(:kw_args) do
    { pokemon: pokemon }
  end

  let(:service_object_call) { described_class.call(kw_args) }

  context 'when success' do
    it { is_expected.to be_truthy }
    it { expect { subject }.to change(Pokemon, :count).from(1).to(0) }
  end
end
