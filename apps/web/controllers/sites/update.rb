module Web
  module Controllers
    module Sites
      class Update
        include Web::Action

        expose :site

        params do
          required(:id).filled(:int?)
          required(:site).schema do
            required(:name).filled(:str?)
            required(:url).filled(:str?)
          end
        end

        def call(params)
          @site = SiteRepository.new.find(params[:id])
          if params.valid?
            SiteRepository.new.update(@site.id, params[:site])

            redirect_to "/sites/#{@site.id}"
          else
            self.status = 422
          end
        end
      end
    end
  end
end
