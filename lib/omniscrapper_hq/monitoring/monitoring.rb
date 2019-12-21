require 'prometheus/client'

module Monitoring
  prometheus = ::Prometheus::Client.registry

  SUCCESSFUL_PAGE_SCRAPPINGS_TOTAL = prometheus.counter(
    :successful_page_scrappings,
    docstring: 'A counter of successfully scrapped pages'
  )

  FAILED_PAGE_SCRAPPINGS_TOTAL = prometheus.counter(
    :failed_page_scrappings,
    docstring: 'A counter of failed page scrappings'
  )

  #prometheus.register(SUCCESSFUL_PAGE_SCRAPPINGS_TOTAL)
  #prometheus.register(FAILED_PAGE_SCRAPPINGS_TOTAL)
end


