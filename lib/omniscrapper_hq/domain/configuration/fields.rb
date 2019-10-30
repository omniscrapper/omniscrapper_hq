module Domain
  module Configuration
    # Infers from schema a list of fields that should be returned by scrapper.
    class Fields
      def list(schema)
        definition = schema.definition
        required_fields = definition[:required]
        fields = definition[:properties]

        fields.map do |name, options|
          {
            name: name,
            required: required_fields.include?(name.to_s)
          }
        end
      end
    end
  end
end
