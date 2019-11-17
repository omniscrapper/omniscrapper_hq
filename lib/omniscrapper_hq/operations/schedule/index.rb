module Operations
  module Schedule
    class Index < Base
      GRAPHQL_CLIENT ||= System::Container['omniscrapper.graphql_client']

      Query ||= GRAPHQL_CLIENT.parse <<-'GRAPHQL'
        query {
          events {
            id,
            name,
            taskId,
            frequencyPeriod,
            frequencyQuantity
          }
        }
      GRAPHQL

      def call
        results = GRAPHQL_CLIENT.query(Query)
        results.data.events.map do |event|
          ::Event.new(
            id: event.id,
            name: event.name,
            task_id: event.task_id,
            frequency_quantity: event.frequency_quantity,
            frequency_period: event.frequency_period
          )
        end
      end
    end
  end
end
