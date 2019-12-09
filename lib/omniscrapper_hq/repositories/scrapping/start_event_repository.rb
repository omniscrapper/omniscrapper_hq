module Scrapping
  class StartEventRepository < Hanami::Repository
    self.relation = :scrapping_started_events

    def job_statuses
      job_statuses = root.read <<-SQL
SELECT task_id, sites.name as site_name, event, count(*) FROM job_events
INNER JOIN tasks ON job_events.task_id=tasks.id
INNER JOIN sites ON tasks.site_id=sites.id
WHERE event IN ('finished', 'failed')
GROUP BY task_id, event, sites.name;
SQL
    end
  end
end
