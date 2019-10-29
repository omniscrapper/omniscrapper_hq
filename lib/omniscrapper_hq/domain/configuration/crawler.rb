module Domain
  module Configuration
    # Builds a list of required fields from scrapper metadata
    class Crawler
      def initialize(scrapper_name)
        @scrapper_name = scrapper_name
      end

      def required_fields
        @required_fields ||= crawler_class::REQUIRED_ATTRIBUTES
      end

      private

      def crawler_class
        OmniScrapper::Crawlers.by_name(@scrapper_name)
      end
    end
  end
end
