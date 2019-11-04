module Operations
  module Output
    class Create < Base
      include Import[
        output_repo: 'repositories.output'
      ]

      # TODO: validate input
      # Create suboperation that validates output reacheability.
      # For example send test message to kafka, or write and remove a record 
      # in MongoDB, or check write access to S3.
      def call(params)
        output_repo.create(params)
      end
    end
  end
end
