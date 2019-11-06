module Web
  module Controllers
    module Sites
      class Destroy
        include Web::Action
        include Dry::Monads::Result::Mixin
        include Import[
            site_repo: 'repositories.site',
            operation: 'operations.site.destroy'
        ]

        def call(params)
          @site = site_repo.find_with_tasks(params[:id])
          result = operation.call(@site)

          case result
          when Success
            flash[:success] = 'Site was successfully destroyed'
            redirect_to routes.sites_path
          when Failure
            flash[:error] = 'Something went wrong'
            redirect_to routes.sites_path
          end
        end
      end
    end
  end
end
