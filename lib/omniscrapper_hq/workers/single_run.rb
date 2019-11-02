require_relative 'base_worker'
require_relative '../operations/single_run/perform'

module Workers
  class SingleRun < BaseWorker
    sidekiq_options queue: :single_run, retry: false

    def perform(task_id)
      Operations::SingleRun::Perform.new.call(task_id: task_id)
    end
  end
end
