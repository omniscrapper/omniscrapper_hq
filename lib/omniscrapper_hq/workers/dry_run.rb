require 'sidekiq'

module Workers
  class DryRun
    include Sidekiq::Worker

    sidekiq_options queue: :dry_run, retry: false

    def perform
    end
  end
end
