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

    def page_statuses(task_id)
      # TODO: fix sql injection here by using proper parametrized query
      root.read("
WITH finished_events AS (SELECT * FROM scrapping_finished_events WHERE task_id=#{task_id})
SELECT event_type, COUNT(*) FROM finished_events
GROUP BY event_type;")
    end

    def exceptions(task_id)
      root.read("
WITH finished_events AS (SELECT * FROM scrapping_finished_events WHERE task_id=#{task_id})
SELECT exception_class, COUNT(*) FROM finished_events
WHERE event_type='failure'
GROUP BY exception_class;")
    end

    def messages(task_id)
      root.read("
WITH finished_events AS (SELECT * FROM scrapping_finished_events WHERE task_id=#{task_id})
SELECT message, COUNT(*) FROM finished_events
WHERE event_type='failure'
GROUP BY message;")
    end

    def traces(task_id)
      root.read("
WITH finished_events AS (SELECT * FROM scrapping_finished_events WHERE task_id=#{task_id})
SELECT trace, COUNT(*) FROM finished_events
WHERE event_type='failure'
GROUP BY trace;")
    end
  end
end
