module OmniscrapperHq
  module Repositories
    module Shared
      module Pagination
        def count(_)
          root.order { id.desc }.count
        end

        def offset(size)
          root.order { id.desc }.offset(size)
        end

        def limit(size)
          root.order { id.desc }.limit(size)
        end
      end
    end
  end
end
