module OmniscrapperHq
  module Repositories
    module Shared
      module Pagination
        def count(_)
          root.count
        end

        def page(offset, size)
          root.offset(offset).limit(size).to_a
        end
      end
    end
  end
end