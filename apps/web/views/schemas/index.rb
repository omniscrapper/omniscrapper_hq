require_relative '../shared/pagination.rb'

module Web
  module Views
    module Schemas
      class Index < BaseView
        include Shared::Pagination
      end
    end
  end
end
