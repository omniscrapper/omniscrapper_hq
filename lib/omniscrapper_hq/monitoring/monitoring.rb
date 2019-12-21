require 'prometheus/client'

module Monitoring
  prometheus = ::Prometheus::Client.registry

  PAGE_SCRAPPINGS_TOTAL = prometheus.counter(
    :omniscrapper_page_scrappings_counter,
    docstring: 'A counter of scrapped pages',
    labels: [:event]
  )

  SCRAPPING_JOB_EVENTS_TOTAL = prometheus.counter(
    :omniscrapper_scrapping_job_events_counter,
    docstring: 'A counter of performed jobs',
    labels: [:event]
  )

  LAST_PAGE_SCRAPPING_DATE = prometheus.gauge(
    :omniscrapper_last_page_scrapping_timestamp,
    docstring: 'A timestamp of last scrapped page'
  )
end


