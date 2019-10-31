require 'sidekiq'

module Workers
  class SingleRun
    include Sidekiq::Worker

    sidekiq_options queue: :single_run, retry: false

    def perform
    end
  end
end
