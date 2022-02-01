# frozen_string_literal: true

RSpec::Matchers.define :match_schema do |schema|
  match do |pokemon|
    case schema
    when :pokemon
      return (
        pokemon['id'] == pokemon['attributes']['id'].to_s         &&
          pokemon['type'] == 'pokemon'                            &&
          pokemon['attributes']['external_id'].is_a?(String)      &&
          pokemon['attributes']['name'].is_a?(String)             &&
          pokemon['attributes']['primary_type'].is_a?(String)     &&
          pokemon['attributes']['secondary_type'].is_a?(String)   &&
          pokemon['attributes']['total'].is_a?(Numeric)           &&
          pokemon['attributes']['hp'].is_a?(Numeric)              &&
          pokemon['attributes']['attack'].is_a?(Numeric)          &&
          pokemon['attributes']['defense'].is_a?(Numeric)         &&
          pokemon['attributes']['special_attack'].is_a?(Numeric)  &&
          pokemon['attributes']['special_defense'].is_a?(Numeric) &&
          pokemon['attributes']['speed'].is_a?(Numeric)           &&
          pokemon['attributes']['generation'].is_a?(String)       &&
          pokemon['attributes']['legendary'].in?([true, false])
      )
    end
  end
end
