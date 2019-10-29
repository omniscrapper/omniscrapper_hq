class CrawlerRepository
  def all
    data_source.all_names
  end

  def first
    data_source.all_names.first
  end

  private

  def data_source
    OmniScrapper::Crawlers
  end
end
