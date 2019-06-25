module Web
  module Views
    module Sites
      class Index
        include Web::View

        def sites
          SiteRepository.new.all
        end
      end
    end
  end
end
