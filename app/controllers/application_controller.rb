# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from(ActiveRecord::RecordNotFound) { head :not_found }
end
