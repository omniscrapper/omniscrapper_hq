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

  SCRAPPING_JOB_EVENTS_TOTAL = prometheus.counter(
    :scrapping_job_events,
    docstring: 'A counter of performed jobs',
    labels: [:event]
  )
end


