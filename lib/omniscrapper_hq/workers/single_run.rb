require 'sidekiq'

module Workers
  class SingleRun
    include Sidekiq::Worker

    sidekiq_options queue: :single_run, retry: false

    def perform(task_id)
    end
  end
end
