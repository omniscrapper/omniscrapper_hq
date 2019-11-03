module Web
  module Controllers
    module Sites
      class Destroy
        include Web::Action

        def call(params)
          @site = repo.find(params[:id])
          repo.delete_with_dependencies(@site.id)

          redirect_to routes.sites_path
        end

        private

        def repo
          @repo ||= SiteRepository.new
        end
      end
    end
  end
end
