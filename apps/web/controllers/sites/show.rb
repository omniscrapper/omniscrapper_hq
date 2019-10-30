# frozen_string_literal: true

module Web
  module Controllers
    module Sites
      class Show
        include Web::Action
        expose :site

        def call(params)
          @site = SiteRepository.new.find(params[:id])
        end
      end
    end
  end
end
