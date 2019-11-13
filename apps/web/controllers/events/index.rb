module Web
  module Controllers
    module Events
      class Index
        include Web::Action
        include Import[
          operation: 'operations.event.index'
        ]

        def call(_)
          @events = operation.call
          p @events
        end

      end
    end
  end
end
