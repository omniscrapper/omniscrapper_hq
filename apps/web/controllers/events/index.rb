module Web
  module Controllers
    module Events
      class Index
        include Web::Action
        include Import[
          operation: 'operations.event.index'
        ]

        expose :events

        def call(_)
          @events = operation.call
        end
      end
    end
  end
end
