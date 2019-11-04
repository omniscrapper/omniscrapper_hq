module Web
  module Controllers
    module Sites
      class Destroy
        include Web::Action
        include Import[
            site_repo: 'repositories.site'
        ]

        def call(params)
          @site = site_repo.find(params[:id])
          site_repo.delete_with_dependencies(@site.id)

          redirect_to routes.sites_path
        end
      end
    end
  end
end
