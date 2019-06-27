module Web
  module Views
    module Sites
      class New
        include Web::View

        def form
          form_for :site, routes.sites_path do
            label :name
            text_field :name
            label :url
            text_field :url

            submit 'Create'
          end
        end
      end
    end
  end
end
