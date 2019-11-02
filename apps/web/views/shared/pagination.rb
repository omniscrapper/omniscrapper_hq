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

        def pagination(*args)
          _raw pagy_bootstrap_nav(args)
        end
      end
    end
  end
end