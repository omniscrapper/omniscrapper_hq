module Web
  module Controllers
    module Sites
      class Index
        include Web::Action
        expose :sites

        def call(params)
          @sites = SiteRepository.new.all
        end
      end
    end
  end
end
