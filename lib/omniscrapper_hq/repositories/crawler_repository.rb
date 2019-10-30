class CrawlerRepository
  include Import[
    data_source: 'omniscrapper.crawlers',
  ]

  def all
    data_source.all_names
  end

  def first
    data_source.all_names.first
  end
end
