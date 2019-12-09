require_relative '../shared/pagination'

module Web
  module Controllers
    module Sites
      class Index
        include Web::Action
        include Controllers::Shared::Pagination

        expose :sites, :pagination_data

        def call(_)
          @pagination_data, @sites = pagy SiteRepository.new
        end
      end
    end
  end
end
