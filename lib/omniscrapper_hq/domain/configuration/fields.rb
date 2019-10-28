module Domain
  module Configuration
    # Infers from schema a list of fields that should be returned by scrapper.
    class Fields
      def initialize(schema)
        @schema_definition = schema.definition
        @required_fields = @schema_definition[:required]
        @fields = @schema_definition[:properties]
      end

      def list
        @fields.map do |name, options|
          {
            name: name,
            required: @required_fields.include?(name.to_s)
          }
        end
      end
    end
  end
end
