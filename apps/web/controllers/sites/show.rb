module Web
  module Controllers
    module Sites
      class Show
        include Web::Action
        include Import[
          site_repo: 'repositories.site'
        ]

        expose :site

        def call(params)
          @site = site_repo.find(params[:id])
        end
      end
    end
  end
end
