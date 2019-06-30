module Web
  module Controllers
    module Sites
      class Create
        include Web::Action

        expose :site

        params do
          required(:site).schema do
            required(:name).filled(:str?)
            required(:url).filled(:str?)
          end
        end

        def call(params)
          if params.valid?
            @site = SiteRepository.new.create(params[:site])

            redirect_to routes.site_path(@site.id)
          else
            self.status = 422
          end
        end
      end
    end
  end
end
