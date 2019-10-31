module Web
  module Controllers
    module Shared
      module Pagination
        include Pagy::Backend

        private

        def pagy_get_items(repository, pagy)
          repository.page(pagy.offset, pagy.items)
        end
      end
    end
  end
end