require_relative '../shared/pagination.rb'

module Web
  module Controllers
    module Sites
      class Index
        include Web::Action
        include Controllers::Shared::Pagination
        include Import[
          site_repo: 'repositories.site'
        ]

        expose :sites, :pagination_data

        def call(_)
          @pagination_data, @sites = pagy site_repo
        end
      end
    end
  end
end
