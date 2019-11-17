module Web
  module Controllers
    module Schedules
      class Index
        include Web::Action
        include Import[
          operation: 'operations.schedule.index'
        ]

        expose :schedules

        def call(_)
          @schedules = operation.call
        end
      end
    end
  end
end
