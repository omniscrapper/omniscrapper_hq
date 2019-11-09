module Web
  module Views
    module Outputs
      module Base
        include Web::View

        def outputs_configuration
          OutputRepository.new.configuration
        end

        def adapters
          outputs_configuration.map { |name, _config| [name, name] }
        end
      end
    end
  end
end
