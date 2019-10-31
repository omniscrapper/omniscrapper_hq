require_relative '../shared/pagination.rb'

module Web
  module Controllers
    module Sites
      class Index
        include Web::Action
        include Controllers::Shared::Pagination

        expose :sites, :pagy_data

        def call(_)
          @pagy_data, @sites = pagy SiteRepository.new
        end
      end
    end
  end
end
