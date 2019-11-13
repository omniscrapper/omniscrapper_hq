module Operations
  module Event
    class Index < Base
      GRAPHQL_CLIENT = System::Container['omniscrapper.graphql_client']

      Query = GRAPHQL_CLIENT.parse <<-'GRAPHQL'
        query {
          events {
            id,
            name,
            frequencyPeriod,
            frequencyQuantity
          }
        }
      GRAPHQL


      def call
        GRAPHQL_CLIENT.query(Query)
      end
    end
  end
end
