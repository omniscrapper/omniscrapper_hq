module Web
  module Controllers
    module Sites
      class Destroy
        include Web::Action

        def call(params)
          @site = SiteRepository.new.find(params[:id])
          SiteRepository.new.delete(@site.id)

          redirect_to routes.sites_path
        end
      end
    end
  end
end
