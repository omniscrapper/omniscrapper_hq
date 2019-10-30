# frozen_string_literal: true

require 'sidekiq'

module Runners
  class Sample
    include Sidekiq::Worker

    def perform; end

    private

    def scrapper_schema; end
  end
end
