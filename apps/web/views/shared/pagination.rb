module Web
  module Views
    module Shared
      module Pagination
        include Pagy::Frontend

        def pagy_url_for(page, pagination)
          options = { pagination.vars[:page_param] => page }
            .merge(pagination.vars[:params])

          routes.path(:sites, options)
        end

        def pagination_nav(*args)
          _raw pagy_bootstrap_nav(*args)
        end
      end
    end
  end
end