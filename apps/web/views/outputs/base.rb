module Web
  module Views
    module Outputs
      class Base
        include Web::View
        include Import[
          output_repo: 'repositories.output'
        ]

        def outputs_configuration
          output_repo.configuration
        end

        def adapters
          outputs_configuration.map { |name, _config| [name, name] }
        end
      end
    end
  end
end
