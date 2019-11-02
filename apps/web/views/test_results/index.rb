require_relative '../shared/pagination.rb'

module Web
  module Views
    module TestResults
      class Index < BaseView
        include Shared::Pagination
      end
    end
  end
end
