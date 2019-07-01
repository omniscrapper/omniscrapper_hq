module Web
  module Controllers
    module Sites
      class Edit
        include Web::Action
        expose :site

        def call(params)
          @site = SiteRepository.new.find(params[:id])
        end
      end
    end
  end
end
