module Web
  module Views
    module Shared
      module Pagination
        include Pagy::Frontend

        def pagy_url_for(page, pagy)
          options = { pagy_data.vars[:page_param] => page }
            .merge(pagy_data.vars[:params])

          routes.path(:sites, options)
        end

        def pagy_bootstrap_nav(*args)
          _raw super
        end
      end
    end
  end
end