require 'sidekiq'

module Workers
  class BaseWorker
    include Sidekiq::Worker

    def perform
      raise NotImplementedError, 'implement perform in child class'
    end
  end
end
