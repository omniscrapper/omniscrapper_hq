module OmniscrapperHq
  module Repositories
    module Shared
      module Pagination
        def count(_)
          root.count
        end

        def offset(size)
          root.offset(size)
        end

        def limit(size)
          root.limit(size)
        end
      end
    end
  end
end