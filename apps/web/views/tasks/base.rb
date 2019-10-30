module Web
  module Views
    module Tasks
      class Base < BaseView
        include Import[
          crawler_config: 'domain.configuration.crawler',
          fields_config: 'domain.configuration.fields'
        ]

        def available_schemas
          to_options SchemaRepository.new.all
        end

        def available_sites
          to_options SiteRepository.new.all
        end

        def available_crawlers
          CrawlerRepository.new.all.map { |c| [c, c] }
        end

        def crawler_fields
          crawler_name = CrawlerRepository.new.first
          crawler_config.required_fields(crawler_name)
        end

        def scrapping_fields
          schema = SchemaRepository.new.first
          fields_config.list(schema)
        end

        private

        def to_options(collection)
          collection.map { |s| [s.name, s.id] }
        end
      end
    end
  end
end
