module Web
  module Views
    module Shared
      module Pagination
        include Pagy::Frontend

        def self.included(view)
          view.class_eval do
            def pagination_nav(data)
              _raw pagy_bootstrap_nav(data)
            end

            private

            def request
              params.env['router.request'].rack_request
            end
          end
        end
      end
    end
  end
end
