module Web
  module Views
    module Tasks
      class Base < BaseView
        include Import[
          crawler_config: 'domain.configuration.crawler',
          fields_config: 'domain.configuration.fields',
          output_repo: 'repositories.output',
          schema_repo: 'repositories.schema',
          site_repo: 'repositories.site',
          crawler_repo: 'repositories.crawler'
        ]

        def available_schemas
          to_options schema_repo.all
        end

        def available_sites
          to_options site_repo.all
        end

        def available_outputs
          to_options output_repo.all
        end

        def available_crawlers
          crawler_repo.all.map { |c| [c, c] }
        end

        def crawler_fields
          crawler_name = crawler_repo.first
          crawler_config.required_fields(crawler_name)
        end

        def scrapping_fields
          schema = schema_repo.first
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
