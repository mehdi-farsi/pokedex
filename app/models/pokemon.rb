# frozen_string_literal: true

class Pokemon < ApplicationRecord
  scope :id_or_name, ->(param) { where(id: param).or(where(name: param)) }
end
