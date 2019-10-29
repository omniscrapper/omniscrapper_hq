module Web
  module Views
    module Tasks
      class Base < BaseView
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
          Domain::Configuration::Crawler.new(crawler_name).required_fields
        end

        def scrapping_fields
          schema = SchemaRepository.new.first
          Domain::Configuration::Fields.new(schema).list
        end

        private

        def to_options(collection)
          collection.map { |s| [s.name, s.id] }
        end
      end
    end
  end
end
