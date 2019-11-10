module Web
  module Views
    module Tasks
      module Base
        def available_schemas
          to_options SchemaRepository.new.all
        end

        def available_sites
          to_options SiteRepository.new.all
        end

        def available_outputs
          to_options OutputRepository.new.all
        end

        def available_crawlers
          CrawlerRepository.new.all.map { |c| [c, c] }
        end

        def available_normalizers
          NormalizerRepository.new.all.map { |n| [n, n] }.prepend([nil, nil])
        end

        def crawler_fields
          crawler_name = CrawlerRepository.new.first
          Domain::Configuration::Crawler.new.required_fields(crawler_name)
        end

        def scrapping_fields
          schema = SchemaRepository.new.last
          Domain::Configuration::Fields.new.list(schema)
        end

        private

        def to_options(collection)
          collection.map { |s| [s.name, s.id] }
        end
      end
    end
  end
end
